import 'dart:async';

import 'package:clock/clock.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifter/features/progress/progress.dart';
import 'package:lifter/features/workout_session/workout_session.dart';
import 'package:lifter/features/workouts/workouts.dart';

part 'workout_session_cubit.freezed.dart';

class WorkoutSessionCubit extends Cubit<WorkoutSessionState> {
  @visibleForTesting
  final AnalyzeWorkoutFeedbackProgressionUseCase analyzeWorkoutFeedbackProgressionUseCase;

  WorkoutSessionCubit({required this.analyzeWorkoutFeedbackProgressionUseCase}) : super(const WorkoutSessionState.started());

  Timer? _restTimer;
  final Stopwatch _restStopwatch = Stopwatch();

  @override
  Future<void> close() {
    _restTimer?.cancel();
    return super.close();
  }

  void load({required WorkoutPlan workoutPlan}) {
    final steps = workoutPlan.steps;
    final firstStep = steps.first;
    final nextExercise = (firstStep as WorkoutStepExercise);

    emit(
      WorkoutSessionState.loaded(
        workoutPlan: workoutPlan,
        currentStep: firstStep,
        currentStepIndex: 0,
        nextExercise: nextExercise,
        isRestingPaused: false,
        hasSessionFinished: false,
        workoutFeedbacks: {},
      ),
    );
  }

  void setNextStep() {
    _restTimer?.cancel();
    _restStopwatch.reset();

    final currentState = state;

    if (currentState is WorkoutSessionLoaded) {
      final currentStepIndex = currentState.currentStepIndex;
      final nextStepIndex = currentStepIndex + 1;

      if (nextStepIndex >= currentState.workoutPlan.steps.length) {
        emit(currentState.copyWith(hasSessionFinished: true));
        return;
      }

      final nextStep = currentState.workoutPlan.steps[nextStepIndex];

      final nextExerciseStep =
          (currentState.workoutPlan.steps.skip(nextStepIndex + 1).firstWhereOrNull((step) => step is WorkoutStepExercise) as WorkoutStepExercise?) ??
          currentState.nextExercise;

      if (nextStep is WorkoutStepTransition) {
        final transition = nextStep.transition;

        if (transition is WorkoutTransitionRest) {
          _restTimer = Timer(transition.restDuration, setNextStep);
          _restStopwatch.start();
        }
      }

      emit(currentState.copyWith(currentStep: nextStep, nextExercise: nextExerciseStep, currentStepIndex: nextStepIndex, isRestingPaused: false));
    }
  }

  void setSetFeedback({required int set, required WorkoutFeedbackPerformance performance}) {
    final currentState = state;

    if (currentState is WorkoutSessionLoaded) {
      final currentStep = currentState.currentStep;

      if (currentStep is WorkoutStepExercise) {
        final exercise = currentStep.exercise;
        final Set<WorkoutFeedback> feedbacks = {...currentState.workoutFeedbacks};

        if (feedbacks.any((feedback) => feedback.exercise == exercise && feedback.set == set)) {
          feedbacks.removeWhere((feedback) => feedback.exercise == exercise && feedback.set == set);
        }

        final feedback = WorkoutFeedback(exercise: exercise, set: set, performance: performance, timestamp: clock.now());
        emit(currentState.copyWith(workoutFeedbacks: {...feedbacks, feedback}));
      }
    }
  }

  bool getSetFeedback({required int set, required WorkoutFeedbackPerformance performance}) {
    final currentState = state;

    if (currentState is WorkoutSessionLoaded) {
      final currentStep = currentState.currentStep;

      if (currentStep is WorkoutStepExercise) {
        final exercise = currentStep.exercise;

        final feedback = currentState.workoutFeedbacks.firstWhereOrNull((feedback) => feedback.exercise == exercise && feedback.set == set);

        return feedback?.performance == performance;
      }
    }

    return false;
  }

  void pauseRestTimer() {
    final currentState = state;

    if (currentState is WorkoutSessionLoaded) {
      final currentStep = currentState.currentStep;

      if (currentStep is WorkoutStepTransition) {
        _restTimer?.cancel();
        _restStopwatch.stop();
        emit(currentState.copyWith(isRestingPaused: true));
      }
    }
  }

  void resumeRestTimer() {
    final currentState = state;

    if (currentState is WorkoutSessionLoaded) {
      final currentStep = currentState.currentStep;

      if (currentStep is WorkoutStepTransition) {
        emit(currentState.copyWith(isRestingPaused: false));
        final restDuration = (currentStep.transition as WorkoutTransitionRest).restDuration;

        final remainingRestDuration = restDuration - _restStopwatch.elapsed;
        _restTimer = Timer(remainingRestDuration, setNextStep);
        _restStopwatch.start();
      }
    }
  }

  void resetFinishedSession() {
    final currentState = state;

    if (currentState is WorkoutSessionLoaded) {
      emit(currentState.copyWith(hasSessionFinished: false));
    }
  }

  bool get canGoToNextStep {
    final currentState = state;

    if (currentState is WorkoutSessionLoaded) {
      final currentStep = currentState.currentStep;

      if (currentStep is WorkoutStepExercise) {
        final exercise = currentStep.exercise;

        final feedback = currentState.workoutFeedbacks.firstWhereOrNull(
          (feedback) => feedback.exercise == exercise && feedback.set == currentStep.setNumber,
        );

        return feedback != null;
      }

      return true;
    }

    return false;
  }

  /// Analyzes progression for a specific exercise based on workout feedback
  ProgressionRecommendation? analyzeExerciseProgression(ExerciseRecommendation exercise) {
    final currentState = state;

    if (currentState is WorkoutSessionLoaded) {
      return analyzeWorkoutFeedbackProgressionUseCase(workoutFeedbacks: currentState.workoutFeedbacks, exercise: exercise);
    }

    return null;
  }

  /// Gets progression recommendations for all exercises in the workout
  Map<int, ProgressionRecommendation> getProgressionRecommendations() {
    final currentState = state;
    final recommendations = <int, ProgressionRecommendation>{};

    if (currentState is WorkoutSessionLoaded) {
      // Get unique exercises from the workout plan
      final exercises = currentState.workoutPlan.steps.whereType<WorkoutStepExercise>().map((step) => step.exercise).toSet();

      // Analyze progression for each exercise
      for (final exercise in exercises) {
        final recommendation = analyzeExerciseProgression(exercise);
        if (recommendation != null) {
          recommendations[exercise.exerciseId] = recommendation;
        }
      }
    }

    return recommendations;
  }

  /// Gets performance summary for a specific exercise
  ExercisePerformanceSummary? getExercisePerformanceSummary(ExerciseRecommendation exercise) {
    final currentState = state;

    if (currentState is WorkoutSessionLoaded) {
      final exerciseFeedbacks = currentState.workoutFeedbacks.where((feedback) => feedback.exercise.exerciseId == exercise.exerciseId).toList();

      if (exerciseFeedbacks.isEmpty) return null;

      // Sort by set number
      exerciseFeedbacks.sort((a, b) => a.set.compareTo(b.set));

      // Count performance types
      final underperformedCount = exerciseFeedbacks.where((f) => f.performance == WorkoutFeedbackPerformance.underperformed).length;
      final performedCount = exerciseFeedbacks.where((f) => f.performance == WorkoutFeedbackPerformance.performed).length;
      final overperformedCount = exerciseFeedbacks.where((f) => f.performance == WorkoutFeedbackPerformance.overperformed).length;

      final totalSets = exerciseFeedbacks.length;
      final completionRate = totalSets / exercise.sets;

      return ExercisePerformanceSummary(
        exerciseId: exercise.exerciseId,
        exerciseName: exercise.exerciseName,
        totalSets: exercise.sets,
        completedSets: totalSets,
        completionRate: completionRate,
        underperformedCount: underperformedCount,
        performedCount: performedCount,
        overperformedCount: overperformedCount,
        underperformedPercentage: totalSets > 0 ? underperformedCount / totalSets : 0.0,
        performedPercentage: totalSets > 0 ? performedCount / totalSets : 0.0,
        overperformedPercentage: totalSets > 0 ? overperformedCount / totalSets : 0.0,
      );
    }

    return null;
  }

  /// Gets performance summary for all exercises in the workout
  Map<int, ExercisePerformanceSummary> getAllExercisePerformanceSummaries() {
    final currentState = state;
    final summaries = <int, ExercisePerformanceSummary>{};

    if (currentState is WorkoutSessionLoaded) {
      // Get unique exercises from the workout plan
      final exercises = currentState.workoutPlan.steps.whereType<WorkoutStepExercise>().map((step) => step.exercise).toSet();

      // Get performance summary for each exercise
      for (final exercise in exercises) {
        final summary = getExercisePerformanceSummary(exercise);
        if (summary != null) {
          summaries[exercise.exerciseId] = summary;
        }
      }
    }

    return summaries;
  }
}

@freezed
sealed class WorkoutSessionState with _$WorkoutSessionState {
  const factory WorkoutSessionState.started() = WorkoutSessionStarted;
  const factory WorkoutSessionState.loaded({
    required WorkoutPlan workoutPlan,
    required WorkoutStep currentStep,
    required int currentStepIndex,
    required WorkoutStepExercise nextExercise,
    required bool isRestingPaused,
    required bool hasSessionFinished,
    required Set<WorkoutFeedback> workoutFeedbacks,
  }) = WorkoutSessionLoaded;

  const WorkoutSessionState._();
}
