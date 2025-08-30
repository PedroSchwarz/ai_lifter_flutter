// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutStepExerciseImpl _$$WorkoutStepExerciseImplFromJson(
  Map<String, dynamic> json,
) => _$WorkoutStepExerciseImpl(
  exercise: ExerciseRecommendation.fromJson(
    json['exercise'] as Map<String, dynamic>,
  ),
  setNumber: (json['setNumber'] as num).toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$WorkoutStepExerciseImplToJson(
  _$WorkoutStepExerciseImpl instance,
) => <String, dynamic>{
  'exercise': instance.exercise,
  'setNumber': instance.setNumber,
  'runtimeType': instance.$type,
};

_$WorkoutStepTransitionImpl _$$WorkoutStepTransitionImplFromJson(
  Map<String, dynamic> json,
) => _$WorkoutStepTransitionImpl(
  transition: WorkoutTransition.fromJson(
    json['transition'] as Map<String, dynamic>,
  ),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$WorkoutStepTransitionImplToJson(
  _$WorkoutStepTransitionImpl instance,
) => <String, dynamic>{
  'transition': instance.transition,
  'runtimeType': instance.$type,
};

_$WorkoutTransitionRestImpl _$$WorkoutTransitionRestImplFromJson(
  Map<String, dynamic> json,
) => _$WorkoutTransitionRestImpl(
  restDuration: Duration(microseconds: (json['restDuration'] as num).toInt()),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$WorkoutTransitionRestImplToJson(
  _$WorkoutTransitionRestImpl instance,
) => <String, dynamic>{
  'restDuration': instance.restDuration.inMicroseconds,
  'runtimeType': instance.$type,
};

_$WorkoutTransitionFeedbackImpl _$$WorkoutTransitionFeedbackImplFromJson(
  Map<String, dynamic> json,
) => _$WorkoutTransitionFeedbackImpl($type: json['runtimeType'] as String?);

Map<String, dynamic> _$$WorkoutTransitionFeedbackImplToJson(
  _$WorkoutTransitionFeedbackImpl instance,
) => <String, dynamic>{'runtimeType': instance.$type};
