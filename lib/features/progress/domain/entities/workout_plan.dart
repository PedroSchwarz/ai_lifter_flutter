enum WorkoutPlanType { strength, hypertrophy, endurance, powerlifting, bodybuilding }

enum ExerciseType { compound, isolation, cardio, flexibility }

enum MuscleGroup { chest, back, legs, shoulders, arms, core, fullBody }

class ExerciseRecommendation {
  final int exerciseId;
  final String exerciseName;
  final ExerciseType exerciseType;
  final int sets;
  final int reps;
  final double? weight;
  final int? restSeconds;
  final String? notes;

  const ExerciseRecommendation({
    required this.exerciseId,
    required this.exerciseName,
    required this.exerciseType,
    required this.sets,
    required this.reps,
    this.weight,
    this.restSeconds,
    this.notes,
  });
}

class WorkoutPlan {
  final String name;
  final WorkoutPlanType type;
  final String description;
  final List<ExerciseRecommendation> exercises;
  final int totalDuration; // in minutes
  final String? notes;

  const WorkoutPlan({
    required this.name,
    required this.type,
    required this.description,
    required this.exercises,
    required this.totalDuration,
    this.notes,
  });
}

class WorkoutPlanRequest {
  final WorkoutPlanType planType;
  final MuscleGroup targetMuscleGroup;
  final int workoutDuration; // in minutes
  final List<int> availableExerciseIds;
  final double? userWeight; // for weight calculations
  final int? userExperienceLevel; // 1-5 scale

  const WorkoutPlanRequest({
    required this.planType,
    required this.targetMuscleGroup,
    required this.workoutDuration,
    required this.availableExerciseIds,
    this.userWeight,
    this.userExperienceLevel,
  });
}
