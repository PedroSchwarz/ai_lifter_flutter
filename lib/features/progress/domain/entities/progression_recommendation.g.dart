// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progression_recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgressionRecommendationImpl _$$ProgressionRecommendationImplFromJson(
  Map<String, dynamic> json,
) => _$ProgressionRecommendationImpl(
  type: $enumDecode(_$ProgressionTypeEnumMap, json['type']),
  suggestedWeight: (json['suggestedWeight'] as num?)?.toDouble(),
  suggestedReps: (json['suggestedReps'] as num?)?.toInt(),
  reasoning: json['reasoning'] as String,
);

Map<String, dynamic> _$$ProgressionRecommendationImplToJson(
  _$ProgressionRecommendationImpl instance,
) => <String, dynamic>{
  'type': _$ProgressionTypeEnumMap[instance.type]!,
  'suggestedWeight': instance.suggestedWeight,
  'suggestedReps': instance.suggestedReps,
  'reasoning': instance.reasoning,
};

const _$ProgressionTypeEnumMap = {
  ProgressionType.maintain: 'maintain',
  ProgressionType.increaseWeight: 'increaseWeight',
  ProgressionType.increaseReps: 'increaseReps',
  ProgressionType.decreaseWeight: 'decreaseWeight',
  ProgressionType.decreaseReps: 'decreaseReps',
};
