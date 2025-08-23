import 'package:lifter/features/progress/domain/entities/workout_plan.dart';

/// Use case for generating hypertrophy-focused workout plans
/// Implements higher volume training with moderate weights (8-12 reps)
class GenerateHypertrophyPlanUseCase {
  /// Generates a hypertrophy-focused workout plan
  WorkoutPlan call({required WorkoutPlanRequest request}) {
    final exercises = _generateHypertrophyExercises(request);

    return WorkoutPlan(
      name: 'Hypertrophy Training - ${request.targetMuscleGroup.name}',
      type: WorkoutPlanType.hypertrophy,
      description: 'Focus on muscle growth with higher volume and moderate weights (8-12 reps)',
      exercises: exercises,
      totalDuration: request.workoutDuration,
      notes: 'Rest 60-90 seconds between sets. Focus on mind-muscle connection and controlled movements.',
    );
  }

  List<ExerciseRecommendation> _generateHypertrophyExercises(WorkoutPlanRequest request) {
    final exercises = <ExerciseRecommendation>[];

    // Primary compound movement (4x8-10)
    exercises.add(_getPrimaryCompoundExercise(request.targetMuscleGroup, 4, 10, 90));

    // Secondary compound movement (3x10-12)
    exercises.add(_getSecondaryCompoundExercise(request.targetMuscleGroup, 3, 12, 75));

    // First isolation movement (3x12-15)
    exercises.add(_getFirstIsolationExercise(request.targetMuscleGroup, 3, 15, 60));

    // Second isolation movement (3x12-15)
    exercises.add(_getSecondIsolationExercise(request.targetMuscleGroup, 3, 15, 60));

    // Optional: Drop set or superset
    if (request.workoutDuration > 60) {
      exercises.add(_getDropSetExercise(request.targetMuscleGroup, 2, 15, 45));
    }

    return exercises;
  }

  ExerciseRecommendation _getPrimaryCompoundExercise(MuscleGroup muscleGroup, int sets, int reps, int restSeconds) {
    switch (muscleGroup) {
      case MuscleGroup.chest:
        return const ExerciseRecommendation(
          exerciseId: 1,
          exerciseName: 'Dumbbell Bench Press',
          exerciseType: ExerciseType.compound,
          sets: 4,
          reps: 10,
          restSeconds: 90,
          notes: 'Focus on chest activation, controlled movement',
        );
      case MuscleGroup.back:
        return const ExerciseRecommendation(
          exerciseId: 2,
          exerciseName: 'Barbell Rows',
          exerciseType: ExerciseType.compound,
          sets: 4,
          reps: 10,
          restSeconds: 90,
          notes: 'Squeeze shoulder blades, controlled movement',
        );
      case MuscleGroup.legs:
        return const ExerciseRecommendation(
          exerciseId: 3,
          exerciseName: 'Leg Press',
          exerciseType: ExerciseType.compound,
          sets: 4,
          reps: 10,
          restSeconds: 90,
          notes: 'Full range of motion, focus on quad activation',
        );
      case MuscleGroup.shoulders:
        return const ExerciseRecommendation(
          exerciseId: 4,
          exerciseName: 'Dumbbell Shoulder Press',
          exerciseType: ExerciseType.compound,
          sets: 4,
          reps: 10,
          restSeconds: 90,
          notes: 'Press directly overhead, avoid leaning back',
        );
      case MuscleGroup.arms:
        return const ExerciseRecommendation(
          exerciseId: 5,
          exerciseName: 'Close-Grip Bench Press',
          exerciseType: ExerciseType.compound,
          sets: 4,
          reps: 10,
          restSeconds: 90,
          notes: 'Focus on tricep activation',
        );
      case MuscleGroup.core:
        return const ExerciseRecommendation(
          exerciseId: 6,
          exerciseName: 'Cable Woodchoppers',
          exerciseType: ExerciseType.compound,
          sets: 4,
          reps: 10,
          restSeconds: 90,
          notes: 'Rotate fully, engage core throughout',
        );
      case MuscleGroup.fullBody:
        return const ExerciseRecommendation(
          exerciseId: 7,
          exerciseName: 'Squat',
          exerciseType: ExerciseType.compound,
          sets: 4,
          reps: 10,
          restSeconds: 90,
          notes: 'Moderate weight, focus on form',
        );
    }
  }

  ExerciseRecommendation _getSecondaryCompoundExercise(MuscleGroup muscleGroup, int sets, int reps, int restSeconds) {
    switch (muscleGroup) {
      case MuscleGroup.chest:
        return const ExerciseRecommendation(
          exerciseId: 8,
          exerciseName: 'Incline Dumbbell Press',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 12,
          restSeconds: 75,
          notes: 'Focus on upper chest activation',
        );
      case MuscleGroup.back:
        return const ExerciseRecommendation(
          exerciseId: 9,
          exerciseName: 'Lat Pulldowns',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 12,
          restSeconds: 75,
          notes: 'Pull to upper chest, squeeze lats',
        );
      case MuscleGroup.legs:
        return const ExerciseRecommendation(
          exerciseId: 10,
          exerciseName: 'Romanian Deadlift',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 12,
          restSeconds: 75,
          notes: 'Focus on hamstring stretch and contraction',
        );
      case MuscleGroup.shoulders:
        return const ExerciseRecommendation(
          exerciseId: 11,
          exerciseName: 'Arnold Press',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 12,
          restSeconds: 75,
          notes: 'Rotate dumbbells during press',
        );
      case MuscleGroup.arms:
        return const ExerciseRecommendation(
          exerciseId: 12,
          exerciseName: 'Pull-ups',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 12,
          restSeconds: 75,
          notes: 'Full range of motion, controlled descent',
        );
      case MuscleGroup.core:
        return const ExerciseRecommendation(
          exerciseId: 13,
          exerciseName: 'Cable Crunches',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 12,
          restSeconds: 75,
          notes: 'Focus on upper ab contraction',
        );
      case MuscleGroup.fullBody:
        return const ExerciseRecommendation(
          exerciseId: 14,
          exerciseName: 'Deadlift',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 12,
          restSeconds: 75,
          notes: 'Moderate weight, focus on form',
        );
    }
  }

  ExerciseRecommendation _getFirstIsolationExercise(MuscleGroup muscleGroup, int sets, int reps, int restSeconds) {
    switch (muscleGroup) {
      case MuscleGroup.chest:
        return const ExerciseRecommendation(
          exerciseId: 15,
          exerciseName: 'Cable Flyes',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 15,
          restSeconds: 60,
          notes: 'Focus on chest stretch and contraction',
        );
      case MuscleGroup.back:
        return const ExerciseRecommendation(
          exerciseId: 16,
          exerciseName: 'Seated Cable Rows',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 15,
          restSeconds: 60,
          notes: 'Squeeze shoulder blades together',
        );
      case MuscleGroup.legs:
        return const ExerciseRecommendation(
          exerciseId: 17,
          exerciseName: 'Leg Extensions',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 15,
          restSeconds: 60,
          notes: 'Focus on quad contraction at top',
        );
      case MuscleGroup.shoulders:
        return const ExerciseRecommendation(
          exerciseId: 18,
          exerciseName: 'Lateral Raises',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 15,
          restSeconds: 60,
          notes: 'Raise to shoulder height, controlled descent',
        );
      case MuscleGroup.arms:
        return const ExerciseRecommendation(
          exerciseId: 19,
          exerciseName: 'Dumbbell Curls',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 15,
          restSeconds: 60,
          notes: 'Strict form, no swinging',
        );
      case MuscleGroup.core:
        return const ExerciseRecommendation(
          exerciseId: 20,
          exerciseName: 'Russian Twists',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 15,
          restSeconds: 60,
          notes: 'Rotate fully, engage obliques',
        );
      case MuscleGroup.fullBody:
        return const ExerciseRecommendation(
          exerciseId: 21,
          exerciseName: 'Push-ups',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 15,
          restSeconds: 60,
          notes: 'Full range of motion',
        );
    }
  }

  ExerciseRecommendation _getSecondIsolationExercise(MuscleGroup muscleGroup, int sets, int reps, int restSeconds) {
    switch (muscleGroup) {
      case MuscleGroup.chest:
        return const ExerciseRecommendation(
          exerciseId: 22,
          exerciseName: 'Dumbbell Pullovers',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 15,
          restSeconds: 60,
          notes: 'Focus on lat and chest stretch',
        );
      case MuscleGroup.back:
        return const ExerciseRecommendation(
          exerciseId: 23,
          exerciseName: 'Face Pulls',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 15,
          restSeconds: 60,
          notes: 'Pull to face level, squeeze rear delts',
        );
      case MuscleGroup.legs:
        return const ExerciseRecommendation(
          exerciseId: 24,
          exerciseName: 'Leg Curls',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 15,
          restSeconds: 60,
          notes: 'Focus on hamstring contraction',
        );
      case MuscleGroup.shoulders:
        return const ExerciseRecommendation(
          exerciseId: 25,
          exerciseName: 'Rear Delt Flyes',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 15,
          restSeconds: 60,
          notes: 'Focus on rear delt activation',
        );
      case MuscleGroup.arms:
        return const ExerciseRecommendation(
          exerciseId: 26,
          exerciseName: 'Tricep Pushdowns',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 15,
          restSeconds: 60,
          notes: 'Keep elbows at sides',
        );
      case MuscleGroup.core:
        return const ExerciseRecommendation(
          exerciseId: 27,
          exerciseName: 'Planks',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 15,
          restSeconds: 60,
          notes: 'Hold for 30-60 seconds per set',
        );
      case MuscleGroup.fullBody:
        return const ExerciseRecommendation(
          exerciseId: 28,
          exerciseName: 'Mountain Climbers',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 15,
          restSeconds: 60,
          notes: 'Keep core engaged throughout',
        );
    }
  }

  ExerciseRecommendation _getDropSetExercise(MuscleGroup muscleGroup, int sets, int reps, int restSeconds) {
    switch (muscleGroup) {
      case MuscleGroup.chest:
        return const ExerciseRecommendation(
          exerciseId: 29,
          exerciseName: 'Push-up Drop Set',
          exerciseType: ExerciseType.compound,
          sets: 2,
          reps: 15,
          restSeconds: 45,
          notes: 'Start with weighted push-ups, drop to bodyweight',
        );
      case MuscleGroup.back:
        return const ExerciseRecommendation(
          exerciseId: 30,
          exerciseName: 'Lat Pulldown Drop Set',
          exerciseType: ExerciseType.isolation,
          sets: 2,
          reps: 15,
          restSeconds: 45,
          notes: 'Drop weight by 20% each set',
        );
      case MuscleGroup.legs:
        return const ExerciseRecommendation(
          exerciseId: 31,
          exerciseName: 'Leg Press Drop Set',
          exerciseType: ExerciseType.compound,
          sets: 2,
          reps: 15,
          restSeconds: 45,
          notes: 'Drop weight by 25% each set',
        );
      case MuscleGroup.shoulders:
        return const ExerciseRecommendation(
          exerciseId: 32,
          exerciseName: 'Lateral Raise Drop Set',
          exerciseType: ExerciseType.isolation,
          sets: 2,
          reps: 15,
          restSeconds: 45,
          notes: 'Drop weight by 30% each set',
        );
      case MuscleGroup.arms:
        return const ExerciseRecommendation(
          exerciseId: 33,
          exerciseName: 'Bicep Curl Drop Set',
          exerciseType: ExerciseType.isolation,
          sets: 2,
          reps: 15,
          restSeconds: 45,
          notes: 'Drop weight by 25% each set',
        );
      case MuscleGroup.core:
        return const ExerciseRecommendation(
          exerciseId: 34,
          exerciseName: 'Plank Variations',
          exerciseType: ExerciseType.isolation,
          sets: 2,
          reps: 15,
          restSeconds: 45,
          notes: 'Regular plank to side plank to reverse plank',
        );
      case MuscleGroup.fullBody:
        return const ExerciseRecommendation(
          exerciseId: 35,
          exerciseName: 'Burpee Drop Set',
          exerciseType: ExerciseType.compound,
          sets: 2,
          reps: 15,
          restSeconds: 45,
          notes: 'Full burpees to half burpees',
        );
    }
  }
}
