import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:lifter/app/app.dart';
import 'package:lifter/features/progress/progress.dart';
import 'package:lifter/features/workouts/workouts.dart';

class WorkoutsRepository {
  @visibleForTesting
  final ExercisesManager exercisesManager;

  @visibleForTesting
  final WorkoutsManager workoutsManager;

  @visibleForTesting
  final WorkoutSetsManager workoutSetsManager;

  @visibleForTesting
  final ProgressionAlgorithmUseCase progressionAlgorithm;

  WorkoutsRepository({
    required this.exercisesManager,
    required this.workoutSetsManager,
    required this.workoutsManager,
    required this.progressionAlgorithm,
  });

  // Exercise operations
  Future<List<Exercise>> getAllExercises() => exercisesManager.getAllExercises();

  Future<Exercise?> getExerciseById(int id) => exercisesManager.getExerciseById(id);

  Future<int> createExercise({required String name, required String category, required String muscleGroup, String? description}) {
    return exercisesManager.insertExercise(
      ExercisesCompanion.insert(name: name, category: category, muscleGroup: muscleGroup, description: Value(description)),
    );
  }

  Future<bool> updateExercise({required int id, required String name, required String category, required String muscleGroup, String? description}) {
    return exercisesManager.updateExercise(
      ExercisesCompanion(
        id: Value(id),
        name: Value(name),
        category: Value(category),
        muscleGroup: Value(muscleGroup),
        description: Value(description),
      ),
    );
  }

  Future<int> deleteExercise(int id) => exercisesManager.deleteExercise(id);

  // Workout operations
  Future<List<Workout>> getAllWorkouts() => workoutsManager.getAllWorkouts();

  Future<Workout?> getWorkoutById(int id) => workoutsManager.getWorkoutById(id);

  Future<int> createWorkout({required String name, required DateTime date, String? notes}) {
    return workoutsManager.insertWorkout(WorkoutsCompanion.insert(name: name, date: date, notes: Value(notes)));
  }

  Future<bool> updateWorkout({required int id, required String name, required DateTime date, String? notes}) {
    return workoutsManager.updateWorkout(WorkoutsCompanion(id: Value(id), name: Value(name), date: Value(date), notes: Value(notes)));
  }

  Future<int> deleteWorkout(int id) => workoutsManager.deleteWorkout(id);

  // Set operations
  Future<List<WorkoutSet>> getSetsForWorkout(int workoutId) => workoutSetsManager.getSetsForWorkout(workoutId);

  Future<List<WorkoutSet>> getSetsForExercise(int exerciseId) => workoutSetsManager.getSetsForExercise(exerciseId);

  Future<List<SetWithExercise>> getSetsWithExerciseForWorkout(int workoutId) => workoutSetsManager.getSetsWithExerciseForWorkout(workoutId);

  Future<int> createSet({
    required int workoutId,
    required int exerciseId,
    required double weight,
    required int reps,
    int? rpe,
    bool isWarmup = false,
  }) {
    return workoutSetsManager.insertSet(
      WorkoutSetsCompanion.insert(
        workoutId: workoutId,
        exerciseId: exerciseId,
        weight: weight,
        reps: reps,
        rpe: Value(rpe),
        isWarmup: Value(isWarmup),
      ),
    );
  }

  Future<bool> updateSet({required int id, required double weight, required int reps, int? rpe, bool isWarmup = false}) {
    return workoutSetsManager.updateSet(
      WorkoutSetsCompanion(id: Value(id), weight: Value(weight), reps: Value(reps), rpe: Value(rpe), isWarmup: Value(isWarmup)),
    );
  }

  Future<int> deleteSet(int id) => workoutSetsManager.deleteSet(id);

  // Progression analysis
  Future<ProgressionRecommendation> getProgressionRecommendation({
    required int exerciseId,
    required double currentWeight,
    required int currentReps,
  }) async {
    final recentSets = await workoutSetsManager.getSetsForExercise(exerciseId);
    return progressionAlgorithm.analyzeProgression(recentSets: recentSets, currentWeight: currentWeight, currentReps: currentReps);
  }

  Future<Map<String, dynamic>> getProgressTrends() async {
    final allSets = await workoutSetsManager.getAllSets();
    return progressionAlgorithm.analyzeProgressTrendsAsMap(allSets: allSets);
  }

  // Helper methods
  Future<List<Exercise>> getExercisesByCategory(String category) async {
    return exercisesManager.getExercisesByCategory(category);
  }

  Future<List<Exercise>> getExercisesByMuscleGroup(String muscleGroup) async {
    return exercisesManager.getExercisesByMuscleGroup(muscleGroup);
  }

  Future<List<Workout>> getWorkoutsByDateRange(DateTime start, DateTime end) async {
    return workoutsManager.getWorkoutsByDateRange(start, end);
  }
}
