import 'package:freezed_annotation/freezed_annotation.dart';

part 'progression_recommendation.freezed.dart';
part 'progression_recommendation.g.dart';

enum ProgressionType { maintain, increaseWeight, increaseReps, decreaseWeight, decreaseReps }

@freezed
class ProgressionRecommendation with _$ProgressionRecommendation {
  const factory ProgressionRecommendation({required ProgressionType type, double? suggestedWeight, int? suggestedReps, required String reasoning}) =
      _ProgressionRecommendation;

  factory ProgressionRecommendation.fromJson(Map<String, dynamic> json) => _$ProgressionRecommendationFromJson(json);
}
