import 'package:drift/drift.dart';
import 'package:lifter/app/database/database_connection.dart' as connection;
import 'package:lifter/features/workouts/workouts.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Exercises, Workouts, WorkoutSets])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connection.DatabaseConnection.connection);

  @override
  int get schemaVersion => 1;
}
