import 'package:drift/drift.dart';
import 'package:lifter/app/database/app_database.dart';
import 'package:lifter/features/workouts/data/data_sources/local/models/set_exercise_model.dart';
import 'package:meta/meta.dart';

/// Manager for workout sets table operations
class WorkoutSetsManager {
  @visibleForTesting
  final AppDatabase database;

  WorkoutSetsManager({required this.database});

  /// Get all sets
  Future<List<WorkoutSet>> getAllSets() => database.select(database.workoutSets).get();

  /// Get sets for a specific workout
  Future<List<WorkoutSet>> getSetsForWorkout(int workoutId) =>
      (database.select(database.workoutSets)..where((s) => s.workoutId.equals(workoutId))).get();

  /// Get sets for a specific exercise
  Future<List<WorkoutSet>> getSetsForExercise(int exerciseId) =>
      (database.select(database.workoutSets)
            ..where((s) => s.exerciseId.equals(exerciseId))
            ..orderBy([(s) => OrderingTerm.desc(s.createdAt)]))
          .get();

  /// Insert a new set
  Future<int> insertSet(WorkoutSetsCompanion set) => database.into(database.workoutSets).insert(set);

  /// Update an existing set
  Future<bool> updateSet(WorkoutSetsCompanion set) => database.update(database.workoutSets).replace(set);

  /// Delete a set by ID
  Future<int> deleteSet(int id) => (database.delete(database.workoutSets)..where((s) => s.id.equals(id))).go();

  /// Get sets with exercise information for a workout
  Future<List<SetWithExercise>> getSetsWithExerciseForWorkout(int workoutId) {
    final query = database.select(database.workoutSets).join([
      leftOuterJoin(database.exercises, database.exercises.id.equalsExp(database.workoutSets.exerciseId)),
    ])..where(database.workoutSets.workoutId.equals(workoutId));

    return query.map((row) {
      return SetWithExercise(set: row.readTable(database.workoutSets), exercise: row.readTableOrNull(database.exercises));
    }).get();
  }

  /// Get sets by date range
  Future<List<WorkoutSet>> getSetsByDateRange(DateTime start, DateTime end) {
    final allSets = database.select(database.workoutSets).get();
    return allSets.then(
      (sets) =>
          sets
              .where((s) => s.createdAt.isAfter(start.subtract(const Duration(days: 1))) && s.createdAt.isBefore(end.add(const Duration(days: 1))))
              .toList()
            ..sort((a, b) => b.createdAt.compareTo(a.createdAt)),
    );
  }
}
