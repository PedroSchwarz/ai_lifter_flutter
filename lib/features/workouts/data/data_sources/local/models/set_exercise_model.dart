import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifter/app/database/app_database.dart';

part 'set_exercise_model.freezed.dart';

/// Data class for combining workout sets with exercise information
@freezed
class SetWithExercise with _$SetWithExercise {
  const factory SetWithExercise({required WorkoutSet set, Exercise? exercise}) = _SetWithExercise;
}
