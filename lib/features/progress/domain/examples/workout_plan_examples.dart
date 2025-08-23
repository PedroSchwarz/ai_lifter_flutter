import 'package:lifter/features/progress/domain/entities/workout_plan.dart';
import 'package:lifter/features/progress/domain/use_cases/generate_hypertrophy_plan_use_case.dart';
import 'package:lifter/features/progress/domain/use_cases/generate_strength_plan_use_case.dart';
import 'package:lifter/features/progress/domain/use_cases/generate_workout_plan_use_case.dart';

/// Example usage of the workout plan generation system
/// This demonstrates how to create different types of workout plans
class WorkoutPlanExamples {
  static final GenerateWorkoutPlanUseCase _generateWorkoutPlanUseCase = GenerateWorkoutPlanUseCase(
    generateStrengthPlanUseCase: GenerateStrengthPlanUseCase(),
    generateHypertrophyPlanUseCase: GenerateHypertrophyPlanUseCase(),
  );

  /// Example: Generate a strength training plan for chest
  static WorkoutPlan generateChestStrengthPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.strength,
      targetMuscleGroup: MuscleGroup.chest,
      workoutDuration: 60,
      availableExerciseIds: [1, 8, 15], // Example exercise IDs
      userWeight: 80.0,
      userExperienceLevel: 3,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a hypertrophy plan for back
  static WorkoutPlan generateBackHypertrophyPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.hypertrophy,
      targetMuscleGroup: MuscleGroup.back,
      workoutDuration: 75,
      availableExerciseIds: [2, 9, 16, 23], // Example exercise IDs
      userWeight: 75.0,
      userExperienceLevel: 2,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate an endurance plan for legs
  static WorkoutPlan generateLegsEndurancePlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.endurance,
      targetMuscleGroup: MuscleGroup.legs,
      workoutDuration: 45,
      availableExerciseIds: [3, 10, 17, 24, 31], // Example exercise IDs
      userWeight: 70.0,
      userExperienceLevel: 1,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a powerlifting plan for full body
  static WorkoutPlan generateFullBodyPowerliftingPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.powerlifting,
      targetMuscleGroup: MuscleGroup.fullBody,
      workoutDuration: 90,
      availableExerciseIds: [7, 14, 21, 28, 35], // Example exercise IDs
      userWeight: 85.0,
      userExperienceLevel: 4,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a bodybuilding plan for shoulders
  static WorkoutPlan generateShouldersBodybuildingPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.bodybuilding,
      targetMuscleGroup: MuscleGroup.shoulders,
      workoutDuration: 60,
      availableExerciseIds: [4, 11, 18, 25, 32], // Example exercise IDs
      userWeight: 78.0,
      userExperienceLevel: 3,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a strength plan for arms
  static WorkoutPlan generateArmsStrengthPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.strength,
      targetMuscleGroup: MuscleGroup.arms,
      workoutDuration: 50,
      availableExerciseIds: [5, 12, 19, 26, 33], // Example exercise IDs
      userWeight: 72.0,
      userExperienceLevel: 2,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a core endurance plan
  static WorkoutPlan generateCoreEndurancePlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.endurance,
      targetMuscleGroup: MuscleGroup.core,
      workoutDuration: 30,
      availableExerciseIds: [6, 13, 20, 27, 34], // Example exercise IDs
      userWeight: 68.0,
      userExperienceLevel: 1,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a hypertrophy plan for chest with longer duration
  static WorkoutPlan generateChestHypertrophyExtendedPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.hypertrophy,
      targetMuscleGroup: MuscleGroup.chest,
      workoutDuration: 90, // Extended duration to include drop sets
      availableExerciseIds: [1, 8, 15, 22, 29], // Example exercise IDs
      userWeight: 82.0,
      userExperienceLevel: 4,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a strength plan for legs with powerlifting focus
  static WorkoutPlan generateLegsStrengthPowerliftingPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.powerlifting,
      targetMuscleGroup: MuscleGroup.legs,
      workoutDuration: 80,
      availableExerciseIds: [3, 10, 17, 24, 31, 38, 45, 52], // Example exercise IDs
      userWeight: 88.0,
      userExperienceLevel: 5,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a full body endurance plan
  static WorkoutPlan generateFullBodyEndurancePlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.endurance,
      targetMuscleGroup: MuscleGroup.fullBody,
      workoutDuration: 60,
      availableExerciseIds: [7, 14, 21, 28, 35, 42, 49, 56], // Example exercise IDs
      userWeight: 73.0,
      userExperienceLevel: 2,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a back strength plan with intermediate experience
  static WorkoutPlan generateBackStrengthIntermediatePlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.strength,
      targetMuscleGroup: MuscleGroup.back,
      workoutDuration: 65,
      availableExerciseIds: [2, 9, 16, 23, 30, 37, 44, 51], // Example exercise IDs
      userWeight: 76.0,
      userExperienceLevel: 3,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a shoulders hypertrophy plan with advanced techniques
  static WorkoutPlan generateShouldersHypertrophyAdvancedPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.hypertrophy,
      targetMuscleGroup: MuscleGroup.shoulders,
      workoutDuration: 85, // Extended duration for advanced techniques
      availableExerciseIds: [4, 11, 18, 25, 32, 39, 46, 53], // Example exercise IDs
      userWeight: 80.0,
      userExperienceLevel: 4,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a core strength plan for advanced users
  static WorkoutPlan generateCoreStrengthAdvancedPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.strength,
      targetMuscleGroup: MuscleGroup.core,
      workoutDuration: 55,
      availableExerciseIds: [6, 13, 20, 27, 34, 41, 48, 55], // Example exercise IDs
      userWeight: 74.0,
      userExperienceLevel: 4,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a chest powerlifting plan for competition prep
  static WorkoutPlan generateChestPowerliftingCompetitionPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.powerlifting,
      targetMuscleGroup: MuscleGroup.chest,
      workoutDuration: 100, // Extended duration for competition prep
      availableExerciseIds: [1, 8, 15, 22, 29, 36, 43, 50], // Example exercise IDs
      userWeight: 90.0,
      userExperienceLevel: 5,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a back hypertrophy plan for muscle building
  static WorkoutPlan generateBackHypertrophyMuscleBuildingPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.hypertrophy,
      targetMuscleGroup: MuscleGroup.back,
      workoutDuration: 70,
      availableExerciseIds: [2, 9, 16, 23, 30, 37, 44, 51], // Example exercise IDs
      userWeight: 77.0,
      userExperienceLevel: 3,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a legs endurance plan for sports performance
  static WorkoutPlan generateLegsEnduranceSportsPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.endurance,
      targetMuscleGroup: MuscleGroup.legs,
      workoutDuration: 50,
      availableExerciseIds: [3, 10, 17, 24, 31, 38, 45, 52], // Example exercise IDs
      userWeight: 71.0,
      userExperienceLevel: 2,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a full body strength plan for beginners
  static WorkoutPlan generateFullBodyStrengthBeginnerPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.strength,
      targetMuscleGroup: MuscleGroup.fullBody,
      workoutDuration: 45,
      availableExerciseIds: [7, 14, 21, 28, 35, 42, 49, 56], // Example exercise IDs
      userWeight: 65.0,
      userExperienceLevel: 1,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate an arms hypertrophy plan for aesthetic goals
  static WorkoutPlan generateArmsHypertrophyAestheticPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.hypertrophy,
      targetMuscleGroup: MuscleGroup.arms,
      workoutDuration: 65,
      availableExerciseIds: [5, 12, 19, 26, 33, 40, 47, 54], // Example exercise IDs
      userWeight: 75.0,
      userExperienceLevel: 3,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a core endurance plan for functional fitness
  static WorkoutPlan generateCoreEnduranceFunctionalPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.endurance,
      targetMuscleGroup: MuscleGroup.core,
      workoutDuration: 35,
      availableExerciseIds: [6, 13, 20, 27, 34, 41, 48, 55], // Example exercise IDs
      userWeight: 69.0,
      userExperienceLevel: 2,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a shoulders powerlifting plan for strength athletes
  static WorkoutPlan generateShouldersPowerliftingStrengthPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.powerlifting,
      targetMuscleGroup: MuscleGroup.shoulders,
      workoutDuration: 75,
      availableExerciseIds: [4, 11, 18, 25, 32, 39, 46, 53], // Example exercise IDs
      userWeight: 83.0,
      userExperienceLevel: 4,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a chest endurance plan for martial artists
  static WorkoutPlan generateChestEnduranceMartialArtsPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.endurance,
      targetMuscleGroup: MuscleGroup.chest,
      workoutDuration: 40,
      availableExerciseIds: [1, 8, 15, 22, 29, 36, 43, 50], // Example exercise IDs
      userWeight: 68.0,
      userExperienceLevel: 2,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a back strength plan for rock climbers
  static WorkoutPlan generateBackStrengthRockClimbingPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.strength,
      targetMuscleGroup: MuscleGroup.back,
      workoutDuration: 60,
      availableExerciseIds: [2, 9, 16, 23, 30, 37, 44, 51], // Example exercise IDs
      userWeight: 72.0,
      userExperienceLevel: 3,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a legs hypertrophy plan for bodybuilders
  static WorkoutPlan generateLegsHypertrophyBodybuildingPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.hypertrophy,
      targetMuscleGroup: MuscleGroup.legs,
      workoutDuration: 80,
      availableExerciseIds: [3, 10, 17, 24, 31, 38, 45, 52], // Example exercise IDs
      userWeight: 79.0,
      userExperienceLevel: 4,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }

  /// Example: Generate a full body endurance plan for crossfitters
  static WorkoutPlan generateFullBodyEnduranceCrossfitPlan() {
    const request = WorkoutPlanRequest(
      planType: WorkoutPlanType.endurance,
      targetMuscleGroup: MuscleGroup.fullBody,
      workoutDuration: 55,
      availableExerciseIds: [7, 14, 21, 28, 35, 42, 49, 56], // Example exercise IDs
      userWeight: 74.0,
      userExperienceLevel: 3,
    );

    return _generateWorkoutPlanUseCase(request: request);
  }
}
