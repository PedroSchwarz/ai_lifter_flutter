// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progression_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgressionDataImpl _$$ProgressionDataImplFromJson(
  Map<String, dynamic> json,
) => _$ProgressionDataImpl(
  recommendations: (json['recommendations'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(
      int.parse(k),
      ProgressionRecommendation.fromJson(e as Map<String, dynamic>),
    ),
  ),
  performanceSummaries: (json['performanceSummaries'] as Map<String, dynamic>)
      .map(
        (k, e) => MapEntry(
          int.parse(k),
          ExercisePerformanceSummary.fromJson(e as Map<String, dynamic>),
        ),
      ),
);

Map<String, dynamic> _$$ProgressionDataImplToJson(
  _$ProgressionDataImpl instance,
) => <String, dynamic>{
  'recommendations': instance.recommendations.map(
    (k, e) => MapEntry(k.toString(), e),
  ),
  'performanceSummaries': instance.performanceSummaries.map(
    (k, e) => MapEntry(k.toString(), e),
  ),
};
