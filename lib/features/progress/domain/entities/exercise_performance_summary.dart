import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_performance_summary.freezed.dart';
part 'exercise_performance_summary.g.dart';

@freezed
class ExercisePerformanceSummary with _$ExercisePerformanceSummary {
  const factory ExercisePerformanceSummary({
    required int exerciseId,
    required String exerciseName,
    required int totalSets,
    required int completedSets,
    required double completionRate,
    required int underperformedCount,
    required int performedCount,
    required int overperformedCount,
    required double underperformedPercentage,
    required double performedPercentage,
    required double overperformedPercentage,
  }) = _ExercisePerformanceSummary;

  factory ExercisePerformanceSummary.fromJson(Map<String, dynamic> json) => _$ExercisePerformanceSummaryFromJson(json);
}
