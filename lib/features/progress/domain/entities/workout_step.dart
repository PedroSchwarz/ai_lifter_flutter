import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifter/features/progress/progress.dart';

part 'workout_step.freezed.dart';
part 'workout_step.g.dart';

@freezed
sealed class WorkoutStep with _$WorkoutStep {
  const factory WorkoutStep.exercise({required ExerciseRecommendation exercise, required int setNumber}) = WorkoutStepExercise;
  const factory WorkoutStep.transition({required WorkoutTransition transition}) = WorkoutStepTransition;

  factory WorkoutStep.fromJson(Map<String, dynamic> json) => _$WorkoutStepFromJson(json);
}

@freezed
sealed class WorkoutTransition with _$WorkoutTransition {
  const factory WorkoutTransition.rest({required Duration restDuration}) = WorkoutTransitionRest;
  const factory WorkoutTransition.feedback() = WorkoutTransitionFeedback;

  factory WorkoutTransition.fromJson(Map<String, dynamic> json) => _$WorkoutTransitionFromJson(json);
}
