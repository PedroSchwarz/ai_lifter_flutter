// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutFeedbackImpl _$$WorkoutFeedbackImplFromJson(
  Map<String, dynamic> json,
) => _$WorkoutFeedbackImpl(
  exercise: ExerciseRecommendation.fromJson(
    json['exercise'] as Map<String, dynamic>,
  ),
  set: (json['set'] as num).toInt(),
  performance: $enumDecode(
    _$WorkoutFeedbackPerformanceEnumMap,
    json['performance'],
  ),
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$$WorkoutFeedbackImplToJson(
  _$WorkoutFeedbackImpl instance,
) => <String, dynamic>{
  'exercise': instance.exercise,
  'set': instance.set,
  'performance': _$WorkoutFeedbackPerformanceEnumMap[instance.performance]!,
  'timestamp': instance.timestamp.toIso8601String(),
};

const _$WorkoutFeedbackPerformanceEnumMap = {
  WorkoutFeedbackPerformance.underperformed: 'underperformed',
  WorkoutFeedbackPerformance.performed: 'performed',
  WorkoutFeedbackPerformance.overperformed: 'overperformed',
};
