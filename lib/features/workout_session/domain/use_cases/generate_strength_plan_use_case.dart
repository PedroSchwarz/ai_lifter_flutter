import 'package:lifter/features/workout_session/workout_session.dart';
import 'package:lifter/features/workouts/workouts.dart';

/// Use case for generating strength-focused workout plans
/// Implements 5x5 methodology and compound exercise focus
class GenerateStrengthPlanUseCase {
  /// Generates a strength-focused workout plan
  WorkoutPlan call({required WorkoutPlanRequest request}) {
    final exercises = _generateStrengthExercises(request);

    final steps = <WorkoutStep>[];

    for (final exercise in exercises) {
      for (var i = 0; i < exercise.sets; i++) {
        steps.add(WorkoutStep.exercise(exercise: exercise, setNumber: i + 1));

        if (exercise == exercises.last && i == exercise.sets - 1) {
          continue;
        }

        steps.add(WorkoutStep.transition(transition: WorkoutTransition.rest(restDuration: Duration(seconds: exercise.restSeconds ?? 180))));
      }
    }

    return WorkoutPlan(
      name: 'Strength Training - ${request.targetMuscleGroup.name}',
      type: WorkoutPlanType.strength,
      description: 'Focus on compound movements with 5x5 sets for maximum strength gains',
      steps: steps,
      totalDurationInMinutes: request.workoutDurationInMinutes,
      notes: 'Rest 3-5 minutes between sets. Focus on form and progressive overload.',
    );
  }

  List<ExerciseRecommendation> _generateStrengthExercises(WorkoutPlanRequest request) {
    final exercises = <ExerciseRecommendation>[];

    // Primary compound movement (5x5)
    exercises.add(_getPrimaryCompoundExercise(request.targetMuscleGroup, 5, 5, 180));

    // Secondary compound movement (3x5)
    exercises.add(_getSecondaryCompoundExercise(request.targetMuscleGroup, 3, 5, 120));

    // Accessory movement (3x8-10)
    exercises.add(_getAccessoryExercise(request.targetMuscleGroup, 3, 8, 90));

    return exercises;
  }

  ExerciseRecommendation _getPrimaryCompoundExercise(MuscleGroup muscleGroup, int sets, int reps, int restSeconds) {
    switch (muscleGroup) {
      case MuscleGroup.chest:
        return const ExerciseRecommendation(
          exerciseId: 1, // Would be mapped to actual exercise ID
          exerciseName: 'Barbell Bench Press',
          exerciseType: ExerciseType.compound,
          sets: 5,
          reps: 5,
          restSeconds: 180,
          notes: 'Focus on controlled descent and explosive press',
        );
      case MuscleGroup.back:
        return const ExerciseRecommendation(
          exerciseId: 2,
          exerciseName: 'Deadlift',
          exerciseType: ExerciseType.compound,
          sets: 5,
          reps: 5,
          restSeconds: 180,
          notes: 'Maintain neutral spine throughout movement',
        );
      case MuscleGroup.legs:
        return const ExerciseRecommendation(
          exerciseId: 3,
          exerciseName: 'Squat',
          exerciseType: ExerciseType.compound,
          sets: 5,
          reps: 5,
          restSeconds: 180,
          notes: 'Keep chest up, knees in line with toes',
        );
      case MuscleGroup.shoulders:
        return const ExerciseRecommendation(
          exerciseId: 4,
          exerciseName: 'Overhead Press',
          exerciseType: ExerciseType.compound,
          sets: 5,
          reps: 5,
          restSeconds: 180,
          notes: 'Press directly overhead, avoid leaning back',
        );
      case MuscleGroup.arms:
        return const ExerciseRecommendation(
          exerciseId: 5,
          exerciseName: 'Weighted Pull-ups',
          exerciseType: ExerciseType.compound,
          sets: 5,
          reps: 5,
          restSeconds: 180,
          notes: 'Full range of motion, controlled descent',
        );
      case MuscleGroup.core:
        return const ExerciseRecommendation(
          exerciseId: 6,
          exerciseName: 'Weighted Planks',
          exerciseType: ExerciseType.compound,
          sets: 5,
          reps: 5,
          restSeconds: 180,
          notes: 'Hold for 30-60 seconds per set',
        );
      case MuscleGroup.fullBody:
        return const ExerciseRecommendation(
          exerciseId: 7,
          exerciseName: 'Deadlift',
          exerciseType: ExerciseType.compound,
          sets: 5,
          reps: 5,
          restSeconds: 180,
          notes: 'Full body compound movement',
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
          reps: 5,
          restSeconds: 120,
          notes: 'Focus on upper chest activation',
        );
      case MuscleGroup.back:
        return const ExerciseRecommendation(
          exerciseId: 9,
          exerciseName: 'Barbell Rows',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 5,
          restSeconds: 120,
          notes: 'Pull elbows back, squeeze shoulder blades',
        );
      case MuscleGroup.legs:
        return const ExerciseRecommendation(
          exerciseId: 10,
          exerciseName: 'Romanian Deadlift',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 5,
          restSeconds: 120,
          notes: 'Focus on hamstring stretch and contraction',
        );
      case MuscleGroup.shoulders:
        return const ExerciseRecommendation(
          exerciseId: 11,
          exerciseName: 'Push Press',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 5,
          restSeconds: 120,
          notes: 'Use leg drive for additional power',
        );
      case MuscleGroup.arms:
        return const ExerciseRecommendation(
          exerciseId: 12,
          exerciseName: 'Dips',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 5,
          restSeconds: 120,
          notes: 'Add weight if bodyweight becomes easy',
        );
      case MuscleGroup.core:
        return const ExerciseRecommendation(
          exerciseId: 13,
          exerciseName: 'Turkish Get-ups',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 5,
          restSeconds: 120,
          notes: 'Slow and controlled movement',
        );
      case MuscleGroup.fullBody:
        return const ExerciseRecommendation(
          exerciseId: 14,
          exerciseName: 'Squat',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 5,
          restSeconds: 120,
          notes: 'Secondary compound movement',
        );
    }
  }

  ExerciseRecommendation _getAccessoryExercise(MuscleGroup muscleGroup, int sets, int reps, int restSeconds) {
    switch (muscleGroup) {
      case MuscleGroup.chest:
        return const ExerciseRecommendation(
          exerciseId: 15,
          exerciseName: 'Dumbbell Flyes',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 8,
          restSeconds: 90,
          notes: 'Focus on chest stretch and contraction',
        );
      case MuscleGroup.back:
        return const ExerciseRecommendation(
          exerciseId: 16,
          exerciseName: 'Lat Pulldowns',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 8,
          restSeconds: 90,
          notes: 'Pull to upper chest, squeeze lats',
        );
      case MuscleGroup.legs:
        return const ExerciseRecommendation(
          exerciseId: 17,
          exerciseName: 'Leg Press',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 8,
          restSeconds: 90,
          notes: 'Full range of motion, controlled movement',
        );
      case MuscleGroup.shoulders:
        return const ExerciseRecommendation(
          exerciseId: 18,
          exerciseName: 'Lateral Raises',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 8,
          restSeconds: 90,
          notes: 'Raise to shoulder height, controlled descent',
        );
      case MuscleGroup.arms:
        return const ExerciseRecommendation(
          exerciseId: 19,
          exerciseName: 'Barbell Curls',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 8,
          restSeconds: 90,
          notes: 'Strict form, no swinging',
        );
      case MuscleGroup.core:
        return const ExerciseRecommendation(
          exerciseId: 20,
          exerciseName: 'Russian Twists',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 8,
          restSeconds: 90,
          notes: 'Rotate fully, engage obliques',
        );
      case MuscleGroup.fullBody:
        return const ExerciseRecommendation(
          exerciseId: 21,
          exerciseName: 'Overhead Press',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 8,
          restSeconds: 90,
          notes: 'Accessory compound movement',
        );
    }
  }
}
