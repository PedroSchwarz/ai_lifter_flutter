import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifter/features/workout_session/workout_session.dart';

part 'workout_plan.freezed.dart';
part 'workout_plan.g.dart';

enum WorkoutPlanType { strength, hypertrophy, endurance, powerlifting, bodybuilding }

enum ExerciseType { compound, isolation, cardio, flexibility }

enum MuscleGroup { chest, back, legs, shoulders, arms, core, fullBody }

@freezed
abstract class ExerciseRecommendation with _$ExerciseRecommendation {
  const factory ExerciseRecommendation({
    required int exerciseId,
    required String exerciseName,
    required ExerciseType exerciseType,
    required int sets,
    required int reps,
    double? weight,
    int? restSeconds,
    String? notes,
  }) = _ExerciseRecommendation;

  factory ExerciseRecommendation.fromJson(Map<String, dynamic> json) => _$ExerciseRecommendationFromJson(json);
}

@freezed
abstract class WorkoutPlan with _$WorkoutPlan {
  const factory WorkoutPlan({
    required String name,
    required WorkoutPlanType type,
    required String description,
    required List<WorkoutStep> steps,
    required int totalDurationInMinutes,
    String? notes,
  }) = _WorkoutPlan;

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) => _$WorkoutPlanFromJson(json);
}

@freezed
abstract class WorkoutPlanRequest with _$WorkoutPlanRequest {
  const factory WorkoutPlanRequest({
    required WorkoutPlanType planType,
    required MuscleGroup targetMuscleGroup,
    required int workoutDurationInMinutes,
    required List<int> availableExerciseIds,
    double? userWeight,
    int? userExperienceLevel,
  }) = _WorkoutPlanRequest;

  factory WorkoutPlanRequest.fromJson(Map<String, dynamic> json) => _$WorkoutPlanRequestFromJson(json);
}
