import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifter/features/progress/progress.dart';

part 'progression_data.freezed.dart';
part 'progression_data.g.dart';

@freezed
class ProgressionData with _$ProgressionData {
  const factory ProgressionData({
    required Map<int, ProgressionRecommendation> recommendations,
    required Map<int, ExercisePerformanceSummary> performanceSummaries,
  }) = _ProgressionData;

  factory ProgressionData.fromJson(Map<String, dynamic> json) => _$ProgressionDataFromJson(json);
}
