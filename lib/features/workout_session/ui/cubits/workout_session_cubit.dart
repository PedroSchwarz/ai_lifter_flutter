import 'dart:async';

import 'package:clock/clock.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifter/features/progress/progress.dart';

part 'workout_session_cubit.freezed.dart';

class WorkoutSessionCubit extends Cubit<WorkoutSessionState> {
  WorkoutSessionCubit() : super(const WorkoutSessionState.started());

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
