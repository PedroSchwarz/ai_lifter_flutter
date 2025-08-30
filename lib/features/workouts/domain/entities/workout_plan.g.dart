// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseRecommendationImpl _$$ExerciseRecommendationImplFromJson(
  Map<String, dynamic> json,
) => _$ExerciseRecommendationImpl(
  exerciseId: (json['exerciseId'] as num).toInt(),
  exerciseName: json['exerciseName'] as String,
  exerciseType: $enumDecode(_$ExerciseTypeEnumMap, json['exerciseType']),
  sets: (json['sets'] as num).toInt(),
  reps: (json['reps'] as num).toInt(),
  weight: (json['weight'] as num?)?.toDouble(),
  restSeconds: (json['restSeconds'] as num?)?.toInt(),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$$ExerciseRecommendationImplToJson(
  _$ExerciseRecommendationImpl instance,
) => <String, dynamic>{
  'exerciseId': instance.exerciseId,
  'exerciseName': instance.exerciseName,
  'exerciseType': _$ExerciseTypeEnumMap[instance.exerciseType]!,
  'sets': instance.sets,
  'reps': instance.reps,
  'weight': instance.weight,
  'restSeconds': instance.restSeconds,
  'notes': instance.notes,
};

const _$ExerciseTypeEnumMap = {
  ExerciseType.compound: 'compound',
  ExerciseType.isolation: 'isolation',
  ExerciseType.cardio: 'cardio',
  ExerciseType.flexibility: 'flexibility',
};

_$WorkoutPlanImpl _$$WorkoutPlanImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutPlanImpl(
      name: json['name'] as String,
      type: $enumDecode(_$WorkoutPlanTypeEnumMap, json['type']),
      description: json['description'] as String,
      steps:
          (json['steps'] as List<dynamic>)
              .map((e) => WorkoutStep.fromJson(e as Map<String, dynamic>))
              .toList(),
      totalDurationInMinutes: (json['totalDurationInMinutes'] as num).toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$WorkoutPlanImplToJson(_$WorkoutPlanImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$WorkoutPlanTypeEnumMap[instance.type]!,
      'description': instance.description,
      'steps': instance.steps,
      'totalDurationInMinutes': instance.totalDurationInMinutes,
      'notes': instance.notes,
    };

const _$WorkoutPlanTypeEnumMap = {
  WorkoutPlanType.strength: 'strength',
  WorkoutPlanType.hypertrophy: 'hypertrophy',
  WorkoutPlanType.endurance: 'endurance',
  WorkoutPlanType.powerlifting: 'powerlifting',
  WorkoutPlanType.bodybuilding: 'bodybuilding',
};

_$WorkoutPlanRequestImpl _$$WorkoutPlanRequestImplFromJson(
  Map<String, dynamic> json,
) => _$WorkoutPlanRequestImpl(
  planType: $enumDecode(_$WorkoutPlanTypeEnumMap, json['planType']),
  targetMuscleGroup: $enumDecode(
    _$MuscleGroupEnumMap,
    json['targetMuscleGroup'],
  ),
  workoutDurationInMinutes: (json['workoutDurationInMinutes'] as num).toInt(),
  availableExerciseIds:
      (json['availableExerciseIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  userWeight: (json['userWeight'] as num?)?.toDouble(),
  userExperienceLevel: (json['userExperienceLevel'] as num?)?.toInt(),
);

Map<String, dynamic> _$$WorkoutPlanRequestImplToJson(
  _$WorkoutPlanRequestImpl instance,
) => <String, dynamic>{
  'planType': _$WorkoutPlanTypeEnumMap[instance.planType]!,
  'targetMuscleGroup': _$MuscleGroupEnumMap[instance.targetMuscleGroup]!,
  'workoutDurationInMinutes': instance.workoutDurationInMinutes,
  'availableExerciseIds': instance.availableExerciseIds,
  'userWeight': instance.userWeight,
  'userExperienceLevel': instance.userExperienceLevel,
};

const _$MuscleGroupEnumMap = {
  MuscleGroup.chest: 'chest',
  MuscleGroup.back: 'back',
  MuscleGroup.legs: 'legs',
  MuscleGroup.shoulders: 'shoulders',
  MuscleGroup.arms: 'arms',
  MuscleGroup.core: 'core',
  MuscleGroup.fullBody: 'fullBody',
};
