import 'package:lifter/features/progress/domain/entities/workout_plan.dart';
import 'package:lifter/features/progress/domain/use_cases/generate_hypertrophy_plan_use_case.dart';
import 'package:lifter/features/progress/domain/use_cases/generate_strength_plan_use_case.dart';

/// Main use case that orchestrates workout plan generation based on plan type
class GenerateWorkoutPlanUseCase {
  final GenerateStrengthPlanUseCase generateStrengthPlanUseCase;
  final GenerateHypertrophyPlanUseCase generateHypertrophyPlanUseCase;

  GenerateWorkoutPlanUseCase({required this.generateStrengthPlanUseCase, required this.generateHypertrophyPlanUseCase});

  /// Generates a workout plan based on the request type
  WorkoutPlan call({required WorkoutPlanRequest request}) {
    switch (request.planType) {
      case WorkoutPlanType.strength:
        return generateStrengthPlanUseCase(request: request);
      case WorkoutPlanType.hypertrophy:
        return generateHypertrophyPlanUseCase(request: request);
      case WorkoutPlanType.endurance:
        return _generateEndurancePlan(request);
      case WorkoutPlanType.powerlifting:
        return _generatePowerliftingPlan(request);
      case WorkoutPlanType.bodybuilding:
        return generateHypertrophyPlanUseCase(request: request); // Bodybuilding uses hypertrophy principles
    }
  }

  /// Generates an endurance-focused workout plan
  WorkoutPlan _generateEndurancePlan(WorkoutPlanRequest request) {
    final exercises = <ExerciseRecommendation>[];

    // High rep compound movements
    exercises.add(_getEnduranceCompoundExercise(request.targetMuscleGroup, 3, 20, 60));

    // High rep isolation movements
    exercises.add(_getEnduranceIsolationExercise(request.targetMuscleGroup, 3, 25, 45));

    // Cardio component
    exercises.add(_getCardioExercise(request.targetMuscleGroup, 2, 30, 30));

    return WorkoutPlan(
      name: 'Endurance Training - ${request.targetMuscleGroup.name}',
      type: WorkoutPlanType.endurance,
      description: 'Focus on muscular endurance with high reps and short rest periods',
      exercises: exercises,
      totalDuration: request.workoutDuration,
      notes: 'Rest 30-60 seconds between sets. Focus on maintaining form throughout high reps.',
    );
  }

  /// Generates a powerlifting-focused workout plan
  WorkoutPlan _generatePowerliftingPlan(WorkoutPlanRequest request) {
    final exercises = <ExerciseRecommendation>[];

    // Main lift (1-3 reps)
    exercises.add(_getPowerliftingMainLift(request.targetMuscleGroup, 5, 3, 300));

    // Secondary lift (3-5 reps)
    exercises.add(_getPowerliftingSecondaryLift(request.targetMuscleGroup, 3, 5, 180));

    // Accessory work (5-8 reps)
    exercises.add(_getPowerliftingAccessory(request.targetMuscleGroup, 3, 8, 120));

    return WorkoutPlan(
      name: 'Powerlifting Training - ${request.targetMuscleGroup.name}',
      type: WorkoutPlanType.powerlifting,
      description: 'Focus on maximal strength with low reps and long rest periods',
      exercises: exercises,
      totalDuration: request.workoutDuration,
      notes: 'Rest 3-5 minutes between main lifts. Focus on maximal effort and perfect form.',
    );
  }

  ExerciseRecommendation _getEnduranceCompoundExercise(MuscleGroup muscleGroup, int sets, int reps, int restSeconds) {
    switch (muscleGroup) {
      case MuscleGroup.chest:
        return const ExerciseRecommendation(
          exerciseId: 36,
          exerciseName: 'Push-ups',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 20,
          restSeconds: 60,
          notes: 'Focus on maintaining form throughout all reps',
        );
      case MuscleGroup.back:
        return const ExerciseRecommendation(
          exerciseId: 37,
          exerciseName: 'Bodyweight Rows',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 20,
          restSeconds: 60,
          notes: 'Use TRX or bar for bodyweight rows',
        );
      case MuscleGroup.legs:
        return const ExerciseRecommendation(
          exerciseId: 38,
          exerciseName: 'Bodyweight Squats',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 20,
          restSeconds: 60,
          notes: 'Full range of motion, controlled movement',
        );
      case MuscleGroup.shoulders:
        return const ExerciseRecommendation(
          exerciseId: 39,
          exerciseName: 'Pike Push-ups',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 20,
          restSeconds: 60,
          notes: 'Focus on shoulder strength and endurance',
        );
      case MuscleGroup.arms:
        return const ExerciseRecommendation(
          exerciseId: 40,
          exerciseName: 'Diamond Push-ups',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 20,
          restSeconds: 60,
          notes: 'Focus on tricep endurance',
        );
      case MuscleGroup.core:
        return const ExerciseRecommendation(
          exerciseId: 41,
          exerciseName: 'Mountain Climbers',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 20,
          restSeconds: 60,
          notes: 'Keep core engaged throughout movement',
        );
      case MuscleGroup.fullBody:
        return const ExerciseRecommendation(
          exerciseId: 42,
          exerciseName: 'Burpees',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 20,
          restSeconds: 60,
          notes: 'Full body endurance exercise',
        );
    }
  }

  ExerciseRecommendation _getEnduranceIsolationExercise(MuscleGroup muscleGroup, int sets, int reps, int restSeconds) {
    switch (muscleGroup) {
      case MuscleGroup.chest:
        return const ExerciseRecommendation(
          exerciseId: 43,
          exerciseName: 'Wall Push-ups',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 25,
          restSeconds: 45,
          notes: 'High rep chest endurance',
        );
      case MuscleGroup.back:
        return const ExerciseRecommendation(
          exerciseId: 44,
          exerciseName: 'Superman Holds',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 25,
          restSeconds: 45,
          notes: 'Hold for 3-5 seconds each rep',
        );
      case MuscleGroup.legs:
        return const ExerciseRecommendation(
          exerciseId: 45,
          exerciseName: 'Wall Sits',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 25,
          restSeconds: 45,
          notes: 'Hold for 30-60 seconds each set',
        );
      case MuscleGroup.shoulders:
        return const ExerciseRecommendation(
          exerciseId: 46,
          exerciseName: 'Arm Circles',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 25,
          restSeconds: 45,
          notes: 'Forward and backward circles',
        );
      case MuscleGroup.arms:
        return const ExerciseRecommendation(
          exerciseId: 47,
          exerciseName: 'Air Squats',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 25,
          restSeconds: 45,
          notes: 'High rep arm endurance',
        );
      case MuscleGroup.core:
        return const ExerciseRecommendation(
          exerciseId: 48,
          exerciseName: 'Crunches',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 25,
          restSeconds: 45,
          notes: 'Controlled movement, focus on form',
        );
      case MuscleGroup.fullBody:
        return const ExerciseRecommendation(
          exerciseId: 49,
          exerciseName: 'Jumping Jacks',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 25,
          restSeconds: 45,
          notes: 'Full body coordination exercise',
        );
    }
  }

  ExerciseRecommendation _getCardioExercise(MuscleGroup muscleGroup, int sets, int reps, int restSeconds) {
    switch (muscleGroup) {
      case MuscleGroup.chest:
        return const ExerciseRecommendation(
          exerciseId: 50,
          exerciseName: 'High Knees',
          exerciseType: ExerciseType.cardio,
          sets: 2,
          reps: 30,
          restSeconds: 30,
          notes: 'High intensity cardio for 30 seconds',
        );
      case MuscleGroup.back:
        return const ExerciseRecommendation(
          exerciseId: 51,
          exerciseName: 'Jump Rope',
          exerciseType: ExerciseType.cardio,
          sets: 2,
          reps: 30,
          restSeconds: 30,
          notes: 'Jump rope for 30 seconds',
        );
      case MuscleGroup.legs:
        return const ExerciseRecommendation(
          exerciseId: 52,
          exerciseName: 'Squat Jumps',
          exerciseType: ExerciseType.cardio,
          sets: 2,
          reps: 30,
          restSeconds: 30,
          notes: 'Explosive squat jumps for 30 seconds',
        );
      case MuscleGroup.shoulders:
        return const ExerciseRecommendation(
          exerciseId: 53,
          exerciseName: 'Arm Swings',
          exerciseType: ExerciseType.cardio,
          sets: 2,
          reps: 30,
          restSeconds: 30,
          notes: 'Fast arm swings for 30 seconds',
        );
      case MuscleGroup.arms:
        return const ExerciseRecommendation(
          exerciseId: 54,
          exerciseName: 'Shadow Boxing',
          exerciseType: ExerciseType.cardio,
          sets: 2,
          reps: 30,
          restSeconds: 30,
          notes: 'Shadow boxing for 30 seconds',
        );
      case MuscleGroup.core:
        return const ExerciseRecommendation(
          exerciseId: 55,
          exerciseName: 'Plank to Downward Dog',
          exerciseType: ExerciseType.cardio,
          sets: 2,
          reps: 30,
          restSeconds: 30,
          notes: 'Dynamic plank movement for 30 seconds',
        );
      case MuscleGroup.fullBody:
        return const ExerciseRecommendation(
          exerciseId: 56,
          exerciseName: 'Burpees',
          exerciseType: ExerciseType.cardio,
          sets: 2,
          reps: 30,
          restSeconds: 30,
          notes: 'Full body cardio for 30 seconds',
        );
    }
  }

  ExerciseRecommendation _getPowerliftingMainLift(MuscleGroup muscleGroup, int sets, int reps, int restSeconds) {
    switch (muscleGroup) {
      case MuscleGroup.chest:
        return const ExerciseRecommendation(
          exerciseId: 57,
          exerciseName: 'Barbell Bench Press',
          exerciseType: ExerciseType.compound,
          sets: 5,
          reps: 3,
          restSeconds: 300,
          notes: 'Maximal effort, perfect form',
        );
      case MuscleGroup.back:
        return const ExerciseRecommendation(
          exerciseId: 58,
          exerciseName: 'Deadlift',
          exerciseType: ExerciseType.compound,
          sets: 5,
          reps: 3,
          restSeconds: 300,
          notes: 'Maximal effort, perfect form',
        );
      case MuscleGroup.legs:
        return const ExerciseRecommendation(
          exerciseId: 59,
          exerciseName: 'Squat',
          exerciseType: ExerciseType.compound,
          sets: 5,
          reps: 3,
          restSeconds: 300,
          notes: 'Maximal effort, perfect form',
        );
      case MuscleGroup.shoulders:
        return const ExerciseRecommendation(
          exerciseId: 60,
          exerciseName: 'Overhead Press',
          exerciseType: ExerciseType.compound,
          sets: 5,
          reps: 3,
          restSeconds: 300,
          notes: 'Maximal effort, perfect form',
        );
      case MuscleGroup.arms:
        return const ExerciseRecommendation(
          exerciseId: 61,
          exerciseName: 'Weighted Pull-ups',
          exerciseType: ExerciseType.compound,
          sets: 5,
          reps: 3,
          restSeconds: 300,
          notes: 'Maximal effort, perfect form',
        );
      case MuscleGroup.core:
        return const ExerciseRecommendation(
          exerciseId: 62,
          exerciseName: 'Weighted Planks',
          exerciseType: ExerciseType.compound,
          sets: 5,
          reps: 3,
          restSeconds: 300,
          notes: 'Hold for 30-60 seconds per set',
        );
      case MuscleGroup.fullBody:
        return const ExerciseRecommendation(
          exerciseId: 63,
          exerciseName: 'Deadlift',
          exerciseType: ExerciseType.compound,
          sets: 5,
          reps: 3,
          restSeconds: 300,
          notes: 'Maximal effort, perfect form',
        );
    }
  }

  ExerciseRecommendation _getPowerliftingSecondaryLift(MuscleGroup muscleGroup, int sets, int reps, int restSeconds) {
    switch (muscleGroup) {
      case MuscleGroup.chest:
        return const ExerciseRecommendation(
          exerciseId: 64,
          exerciseName: 'Incline Barbell Press',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 5,
          restSeconds: 180,
          notes: 'Heavy weight, good form',
        );
      case MuscleGroup.back:
        return const ExerciseRecommendation(
          exerciseId: 65,
          exerciseName: 'Barbell Rows',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 5,
          restSeconds: 180,
          notes: 'Heavy weight, good form',
        );
      case MuscleGroup.legs:
        return const ExerciseRecommendation(
          exerciseId: 66,
          exerciseName: 'Romanian Deadlift',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 5,
          restSeconds: 180,
          notes: 'Heavy weight, good form',
        );
      case MuscleGroup.shoulders:
        return const ExerciseRecommendation(
          exerciseId: 67,
          exerciseName: 'Push Press',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 5,
          restSeconds: 180,
          notes: 'Heavy weight, good form',
        );
      case MuscleGroup.arms:
        return const ExerciseRecommendation(
          exerciseId: 68,
          exerciseName: 'Weighted Dips',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 5,
          restSeconds: 180,
          notes: 'Heavy weight, good form',
        );
      case MuscleGroup.core:
        return const ExerciseRecommendation(
          exerciseId: 69,
          exerciseName: 'Turkish Get-ups',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 5,
          restSeconds: 180,
          notes: 'Heavy weight, good form',
        );
      case MuscleGroup.fullBody:
        return const ExerciseRecommendation(
          exerciseId: 70,
          exerciseName: 'Squat',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 5,
          restSeconds: 180,
          notes: 'Heavy weight, good form',
        );
    }
  }

  ExerciseRecommendation _getPowerliftingAccessory(MuscleGroup muscleGroup, int sets, int reps, int restSeconds) {
    switch (muscleGroup) {
      case MuscleGroup.chest:
        return const ExerciseRecommendation(
          exerciseId: 71,
          exerciseName: 'Dumbbell Flyes',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 8,
          restSeconds: 120,
          notes: 'Accessory work for chest development',
        );
      case MuscleGroup.back:
        return const ExerciseRecommendation(
          exerciseId: 72,
          exerciseName: 'Lat Pulldowns',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 8,
          restSeconds: 120,
          notes: 'Accessory work for back development',
        );
      case MuscleGroup.legs:
        return const ExerciseRecommendation(
          exerciseId: 73,
          exerciseName: 'Leg Press',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 8,
          restSeconds: 120,
          notes: 'Accessory work for leg development',
        );
      case MuscleGroup.shoulders:
        return const ExerciseRecommendation(
          exerciseId: 74,
          exerciseName: 'Lateral Raises',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 8,
          restSeconds: 120,
          notes: 'Accessory work for shoulder development',
        );
      case MuscleGroup.arms:
        return const ExerciseRecommendation(
          exerciseId: 75,
          exerciseName: 'Barbell Curls',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 8,
          restSeconds: 120,
          notes: 'Accessory work for arm development',
        );
      case MuscleGroup.core:
        return const ExerciseRecommendation(
          exerciseId: 76,
          exerciseName: 'Russian Twists',
          exerciseType: ExerciseType.isolation,
          sets: 3,
          reps: 8,
          restSeconds: 120,
          notes: 'Accessory work for core development',
        );
      case MuscleGroup.fullBody:
        return const ExerciseRecommendation(
          exerciseId: 77,
          exerciseName: 'Overhead Press',
          exerciseType: ExerciseType.compound,
          sets: 3,
          reps: 8,
          restSeconds: 120,
          notes: 'Accessory work for full body development',
        );
    }
  }
}
