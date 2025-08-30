// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_performance_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExercisePerformanceSummaryImpl _$$ExercisePerformanceSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$ExercisePerformanceSummaryImpl(
  exerciseId: (json['exerciseId'] as num).toInt(),
  exerciseName: json['exerciseName'] as String,
  totalSets: (json['totalSets'] as num).toInt(),
  completedSets: (json['completedSets'] as num).toInt(),
  completionRate: (json['completionRate'] as num).toDouble(),
  underperformedCount: (json['underperformedCount'] as num).toInt(),
  performedCount: (json['performedCount'] as num).toInt(),
  overperformedCount: (json['overperformedCount'] as num).toInt(),
  underperformedPercentage:
      (json['underperformedPercentage'] as num).toDouble(),
  performedPercentage: (json['performedPercentage'] as num).toDouble(),
  overperformedPercentage: (json['overperformedPercentage'] as num).toDouble(),
);

Map<String, dynamic> _$$ExercisePerformanceSummaryImplToJson(
  _$ExercisePerformanceSummaryImpl instance,
) => <String, dynamic>{
  'exerciseId': instance.exerciseId,
  'exerciseName': instance.exerciseName,
  'totalSets': instance.totalSets,
  'completedSets': instance.completedSets,
  'completionRate': instance.completionRate,
  'underperformedCount': instance.underperformedCount,
  'performedCount': instance.performedCount,
  'overperformedCount': instance.overperformedCount,
  'underperformedPercentage': instance.underperformedPercentage,
  'performedPercentage': instance.performedPercentage,
  'overperformedPercentage': instance.overperformedPercentage,
};
