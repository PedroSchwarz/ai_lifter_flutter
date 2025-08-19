import 'package:drift/drift.dart';
import 'package:lifter/app/database/app_database.dart';
import 'package:meta/meta.dart';

/// Manager for workouts table operations
class WorkoutsManager {
  @visibleForTesting
  final AppDatabase database;

  WorkoutsManager({required this.database});

  /// Get all workouts ordered by date (newest first)
  Future<List<Workout>> getAllWorkouts() => (database.select(database.workouts)..orderBy([(w) => OrderingTerm.desc(w.date)])).get();

  /// Get workout by ID
  Future<Workout?> getWorkoutById(int id) => (database.select(database.workouts)..where((w) => w.id.equals(id))).getSingleOrNull();

  /// Insert a new workout
  Future<int> insertWorkout(WorkoutsCompanion workout) => database.into(database.workouts).insert(workout);

  /// Update an existing workout
  Future<bool> updateWorkout(WorkoutsCompanion workout) => database.update(database.workouts).replace(workout);

  /// Delete a workout by ID
  Future<int> deleteWorkout(int id) => (database.delete(database.workouts)..where((w) => w.id.equals(id))).go();

  /// Get workouts by date range
  Future<List<Workout>> getWorkoutsByDateRange(DateTime start, DateTime end) {
    final allWorkouts = database.select(database.workouts).get();
    return allWorkouts.then(
      (workouts) =>
          workouts.where((w) => w.date.isAfter(start.subtract(const Duration(days: 1))) && w.date.isBefore(end.add(const Duration(days: 1)))).toList()
            ..sort((a, b) => b.date.compareTo(a.date)),
    );
  }
}
