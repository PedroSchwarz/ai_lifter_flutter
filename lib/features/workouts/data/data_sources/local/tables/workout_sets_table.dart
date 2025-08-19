import 'package:drift/drift.dart';
import 'package:lifter/features/workouts/data/data_sources/local/tables/exercises_table.dart';
import 'package:lifter/features/workouts/data/data_sources/local/tables/workouts_table.dart';

/// Workout set table definition
class WorkoutSets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutId => integer().references(Workouts, #id)();
  IntColumn get exerciseId => integer().references(Exercises, #id)();
  RealColumn get weight => real()(); // in kg
  IntColumn get reps => integer()();
  IntColumn get rpe => integer().nullable()(); // Rate of Perceived Exertion (1-10)
  BoolColumn get isWarmup => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
