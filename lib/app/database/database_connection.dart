import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Handles the database connection setup and configuration
class DatabaseConnection {
  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'lifter.db'));
      return NativeDatabase.createInBackground(file);
    });
  }

  /// Creates a new database connection
  static LazyDatabase get connection => _openConnection();
}
