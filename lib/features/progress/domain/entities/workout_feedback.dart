import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifter/features/progress/progress.dart';

part 'workout_feedback.freezed.dart';
part 'workout_feedback.g.dart';

@freezed
sealed class WorkoutFeedback with _$WorkoutFeedback {
  const factory WorkoutFeedback({
    required ExerciseRecommendation exercise,
    required int set,
    required WorkoutFeedbackPerformance performance,
    required DateTime timestamp,
  }) = _WorkoutFeedback;

  factory WorkoutFeedback.fromJson(Map<String, dynamic> json) => _$WorkoutFeedbackFromJson(json);
}

enum WorkoutFeedbackPerformance { underperformed, performed, overperformed }
