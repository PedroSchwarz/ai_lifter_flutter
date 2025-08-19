import 'package:flutter/material.dart';
import 'package:lifter/app/database/app_database.dart';

/// Manager for exercises table operations
class ExercisesManager {
  @visibleForTesting
  final AppDatabase database;

  ExercisesManager({required this.database});

  /// Get all exercises
  Future<List<Exercise>> getAllExercises() => database.select(database.exercises).get();

  /// Get exercise by ID
  Future<Exercise?> getExerciseById(int id) => (database.select(database.exercises)..where((e) => e.id.equals(id))).getSingleOrNull();

  /// Insert a new exercise
  Future<int> insertExercise(ExercisesCompanion exercise) => database.into(database.exercises).insert(exercise);

  /// Update an existing exercise
  Future<bool> updateExercise(ExercisesCompanion exercise) => database.update(database.exercises).replace(exercise);

  /// Delete an exercise by ID
  Future<int> deleteExercise(int id) => (database.delete(database.exercises)..where((e) => e.id.equals(id))).go();

  /// Get exercises by category
  Future<List<Exercise>> getExercisesByCategory(String category) =>
      (database.select(database.exercises)..where((e) => e.category.equals(category))).get();

  /// Get exercises by muscle group
  Future<List<Exercise>> getExercisesByMuscleGroup(String muscleGroup) =>
      (database.select(database.exercises)..where((e) => e.muscleGroup.equals(muscleGroup))).get();
}
