import 'package:drift/drift.dart';

/// Exercise table definition
class Exercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get category => text()(); // e.g., 'strength', 'cardio', 'flexibility'
  TextColumn get muscleGroup => text()(); // e.g., 'chest', 'back', 'legs'
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
