// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkoutStep _$WorkoutStepFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'exercise':
      return WorkoutStepExercise.fromJson(json);
    case 'transition':
      return WorkoutStepTransition.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'WorkoutStep',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$WorkoutStep {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ExerciseRecommendation exercise, int setNumber)
    exercise,
    required TResult Function(WorkoutTransition transition) transition,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ExerciseRecommendation exercise, int setNumber)? exercise,
    TResult? Function(WorkoutTransition transition)? transition,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ExerciseRecommendation exercise, int setNumber)? exercise,
    TResult Function(WorkoutTransition transition)? transition,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkoutStepExercise value) exercise,
    required TResult Function(WorkoutStepTransition value) transition,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkoutStepExercise value)? exercise,
    TResult? Function(WorkoutStepTransition value)? transition,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkoutStepExercise value)? exercise,
    TResult Function(WorkoutStepTransition value)? transition,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this WorkoutStep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutStepCopyWith<$Res> {
  factory $WorkoutStepCopyWith(
    WorkoutStep value,
    $Res Function(WorkoutStep) then,
  ) = _$WorkoutStepCopyWithImpl<$Res, WorkoutStep>;
}

/// @nodoc
class _$WorkoutStepCopyWithImpl<$Res, $Val extends WorkoutStep>
    implements $WorkoutStepCopyWith<$Res> {
  _$WorkoutStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutStep
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$WorkoutStepExerciseImplCopyWith<$Res> {
  factory _$$WorkoutStepExerciseImplCopyWith(
    _$WorkoutStepExerciseImpl value,
    $Res Function(_$WorkoutStepExerciseImpl) then,
  ) = __$$WorkoutStepExerciseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ExerciseRecommendation exercise, int setNumber});

  $ExerciseRecommendationCopyWith<$Res> get exercise;
}

/// @nodoc
class __$$WorkoutStepExerciseImplCopyWithImpl<$Res>
    extends _$WorkoutStepCopyWithImpl<$Res, _$WorkoutStepExerciseImpl>
    implements _$$WorkoutStepExerciseImplCopyWith<$Res> {
  __$$WorkoutStepExerciseImplCopyWithImpl(
    _$WorkoutStepExerciseImpl _value,
    $Res Function(_$WorkoutStepExerciseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? exercise = null, Object? setNumber = null}) {
    return _then(
      _$WorkoutStepExerciseImpl(
        exercise:
            null == exercise
                ? _value.exercise
                : exercise // ignore: cast_nullable_to_non_nullable
                    as ExerciseRecommendation,
        setNumber:
            null == setNumber
                ? _value.setNumber
                : setNumber // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }

  /// Create a copy of WorkoutStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExerciseRecommendationCopyWith<$Res> get exercise {
    return $ExerciseRecommendationCopyWith<$Res>(_value.exercise, (value) {
      return _then(_value.copyWith(exercise: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutStepExerciseImpl implements WorkoutStepExercise {
  const _$WorkoutStepExerciseImpl({
    required this.exercise,
    required this.setNumber,
    final String? $type,
  }) : $type = $type ?? 'exercise';

  factory _$WorkoutStepExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutStepExerciseImplFromJson(json);

  @override
  final ExerciseRecommendation exercise;
  @override
  final int setNumber;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'WorkoutStep.exercise(exercise: $exercise, setNumber: $setNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutStepExerciseImpl &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.setNumber, setNumber) ||
                other.setNumber == setNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, exercise, setNumber);

  /// Create a copy of WorkoutStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutStepExerciseImplCopyWith<_$WorkoutStepExerciseImpl> get copyWith =>
      __$$WorkoutStepExerciseImplCopyWithImpl<_$WorkoutStepExerciseImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ExerciseRecommendation exercise, int setNumber)
    exercise,
    required TResult Function(WorkoutTransition transition) transition,
  }) {
    return exercise(this.exercise, setNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ExerciseRecommendation exercise, int setNumber)? exercise,
    TResult? Function(WorkoutTransition transition)? transition,
  }) {
    return exercise?.call(this.exercise, setNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ExerciseRecommendation exercise, int setNumber)? exercise,
    TResult Function(WorkoutTransition transition)? transition,
    required TResult orElse(),
  }) {
    if (exercise != null) {
      return exercise(this.exercise, setNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkoutStepExercise value) exercise,
    required TResult Function(WorkoutStepTransition value) transition,
  }) {
    return exercise(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkoutStepExercise value)? exercise,
    TResult? Function(WorkoutStepTransition value)? transition,
  }) {
    return exercise?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkoutStepExercise value)? exercise,
    TResult Function(WorkoutStepTransition value)? transition,
    required TResult orElse(),
  }) {
    if (exercise != null) {
      return exercise(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutStepExerciseImplToJson(this);
  }
}

abstract class WorkoutStepExercise implements WorkoutStep {
  const factory WorkoutStepExercise({
    required final ExerciseRecommendation exercise,
    required final int setNumber,
  }) = _$WorkoutStepExerciseImpl;

  factory WorkoutStepExercise.fromJson(Map<String, dynamic> json) =
      _$WorkoutStepExerciseImpl.fromJson;

  ExerciseRecommendation get exercise;
  int get setNumber;

  /// Create a copy of WorkoutStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutStepExerciseImplCopyWith<_$WorkoutStepExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WorkoutStepTransitionImplCopyWith<$Res> {
  factory _$$WorkoutStepTransitionImplCopyWith(
    _$WorkoutStepTransitionImpl value,
    $Res Function(_$WorkoutStepTransitionImpl) then,
  ) = __$$WorkoutStepTransitionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WorkoutTransition transition});

  $WorkoutTransitionCopyWith<$Res> get transition;
}

/// @nodoc
class __$$WorkoutStepTransitionImplCopyWithImpl<$Res>
    extends _$WorkoutStepCopyWithImpl<$Res, _$WorkoutStepTransitionImpl>
    implements _$$WorkoutStepTransitionImplCopyWith<$Res> {
  __$$WorkoutStepTransitionImplCopyWithImpl(
    _$WorkoutStepTransitionImpl _value,
    $Res Function(_$WorkoutStepTransitionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? transition = null}) {
    return _then(
      _$WorkoutStepTransitionImpl(
        transition:
            null == transition
                ? _value.transition
                : transition // ignore: cast_nullable_to_non_nullable
                    as WorkoutTransition,
      ),
    );
  }

  /// Create a copy of WorkoutStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkoutTransitionCopyWith<$Res> get transition {
    return $WorkoutTransitionCopyWith<$Res>(_value.transition, (value) {
      return _then(_value.copyWith(transition: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutStepTransitionImpl implements WorkoutStepTransition {
  const _$WorkoutStepTransitionImpl({
    required this.transition,
    final String? $type,
  }) : $type = $type ?? 'transition';

  factory _$WorkoutStepTransitionImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutStepTransitionImplFromJson(json);

  @override
  final WorkoutTransition transition;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'WorkoutStep.transition(transition: $transition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutStepTransitionImpl &&
            (identical(other.transition, transition) ||
                other.transition == transition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transition);

  /// Create a copy of WorkoutStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutStepTransitionImplCopyWith<_$WorkoutStepTransitionImpl>
  get copyWith =>
      __$$WorkoutStepTransitionImplCopyWithImpl<_$WorkoutStepTransitionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ExerciseRecommendation exercise, int setNumber)
    exercise,
    required TResult Function(WorkoutTransition transition) transition,
  }) {
    return transition(this.transition);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ExerciseRecommendation exercise, int setNumber)? exercise,
    TResult? Function(WorkoutTransition transition)? transition,
  }) {
    return transition?.call(this.transition);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ExerciseRecommendation exercise, int setNumber)? exercise,
    TResult Function(WorkoutTransition transition)? transition,
    required TResult orElse(),
  }) {
    if (transition != null) {
      return transition(this.transition);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkoutStepExercise value) exercise,
    required TResult Function(WorkoutStepTransition value) transition,
  }) {
    return transition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkoutStepExercise value)? exercise,
    TResult? Function(WorkoutStepTransition value)? transition,
  }) {
    return transition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkoutStepExercise value)? exercise,
    TResult Function(WorkoutStepTransition value)? transition,
    required TResult orElse(),
  }) {
    if (transition != null) {
      return transition(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutStepTransitionImplToJson(this);
  }
}

abstract class WorkoutStepTransition implements WorkoutStep {
  const factory WorkoutStepTransition({
    required final WorkoutTransition transition,
  }) = _$WorkoutStepTransitionImpl;

  factory WorkoutStepTransition.fromJson(Map<String, dynamic> json) =
      _$WorkoutStepTransitionImpl.fromJson;

  WorkoutTransition get transition;

  /// Create a copy of WorkoutStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutStepTransitionImplCopyWith<_$WorkoutStepTransitionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

WorkoutTransition _$WorkoutTransitionFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'rest':
      return WorkoutTransitionRest.fromJson(json);
    case 'feedback':
      return WorkoutTransitionFeedback.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'WorkoutTransition',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$WorkoutTransition {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration restDuration) rest,
    required TResult Function() feedback,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration restDuration)? rest,
    TResult? Function()? feedback,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration restDuration)? rest,
    TResult Function()? feedback,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkoutTransitionRest value) rest,
    required TResult Function(WorkoutTransitionFeedback value) feedback,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkoutTransitionRest value)? rest,
    TResult? Function(WorkoutTransitionFeedback value)? feedback,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkoutTransitionRest value)? rest,
    TResult Function(WorkoutTransitionFeedback value)? feedback,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this WorkoutTransition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutTransitionCopyWith<$Res> {
  factory $WorkoutTransitionCopyWith(
    WorkoutTransition value,
    $Res Function(WorkoutTransition) then,
  ) = _$WorkoutTransitionCopyWithImpl<$Res, WorkoutTransition>;
}

/// @nodoc
class _$WorkoutTransitionCopyWithImpl<$Res, $Val extends WorkoutTransition>
    implements $WorkoutTransitionCopyWith<$Res> {
  _$WorkoutTransitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutTransition
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$WorkoutTransitionRestImplCopyWith<$Res> {
  factory _$$WorkoutTransitionRestImplCopyWith(
    _$WorkoutTransitionRestImpl value,
    $Res Function(_$WorkoutTransitionRestImpl) then,
  ) = __$$WorkoutTransitionRestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration restDuration});
}

/// @nodoc
class __$$WorkoutTransitionRestImplCopyWithImpl<$Res>
    extends _$WorkoutTransitionCopyWithImpl<$Res, _$WorkoutTransitionRestImpl>
    implements _$$WorkoutTransitionRestImplCopyWith<$Res> {
  __$$WorkoutTransitionRestImplCopyWithImpl(
    _$WorkoutTransitionRestImpl _value,
    $Res Function(_$WorkoutTransitionRestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutTransition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? restDuration = null}) {
    return _then(
      _$WorkoutTransitionRestImpl(
        restDuration:
            null == restDuration
                ? _value.restDuration
                : restDuration // ignore: cast_nullable_to_non_nullable
                    as Duration,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutTransitionRestImpl implements WorkoutTransitionRest {
  const _$WorkoutTransitionRestImpl({
    required this.restDuration,
    final String? $type,
  }) : $type = $type ?? 'rest';

  factory _$WorkoutTransitionRestImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutTransitionRestImplFromJson(json);

  @override
  final Duration restDuration;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'WorkoutTransition.rest(restDuration: $restDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutTransitionRestImpl &&
            (identical(other.restDuration, restDuration) ||
                other.restDuration == restDuration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, restDuration);

  /// Create a copy of WorkoutTransition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutTransitionRestImplCopyWith<_$WorkoutTransitionRestImpl>
  get copyWith =>
      __$$WorkoutTransitionRestImplCopyWithImpl<_$WorkoutTransitionRestImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration restDuration) rest,
    required TResult Function() feedback,
  }) {
    return rest(restDuration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration restDuration)? rest,
    TResult? Function()? feedback,
  }) {
    return rest?.call(restDuration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration restDuration)? rest,
    TResult Function()? feedback,
    required TResult orElse(),
  }) {
    if (rest != null) {
      return rest(restDuration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkoutTransitionRest value) rest,
    required TResult Function(WorkoutTransitionFeedback value) feedback,
  }) {
    return rest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkoutTransitionRest value)? rest,
    TResult? Function(WorkoutTransitionFeedback value)? feedback,
  }) {
    return rest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkoutTransitionRest value)? rest,
    TResult Function(WorkoutTransitionFeedback value)? feedback,
    required TResult orElse(),
  }) {
    if (rest != null) {
      return rest(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutTransitionRestImplToJson(this);
  }
}

abstract class WorkoutTransitionRest implements WorkoutTransition {
  const factory WorkoutTransitionRest({required final Duration restDuration}) =
      _$WorkoutTransitionRestImpl;

  factory WorkoutTransitionRest.fromJson(Map<String, dynamic> json) =
      _$WorkoutTransitionRestImpl.fromJson;

  Duration get restDuration;

  /// Create a copy of WorkoutTransition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutTransitionRestImplCopyWith<_$WorkoutTransitionRestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WorkoutTransitionFeedbackImplCopyWith<$Res> {
  factory _$$WorkoutTransitionFeedbackImplCopyWith(
    _$WorkoutTransitionFeedbackImpl value,
    $Res Function(_$WorkoutTransitionFeedbackImpl) then,
  ) = __$$WorkoutTransitionFeedbackImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WorkoutTransitionFeedbackImplCopyWithImpl<$Res>
    extends
        _$WorkoutTransitionCopyWithImpl<$Res, _$WorkoutTransitionFeedbackImpl>
    implements _$$WorkoutTransitionFeedbackImplCopyWith<$Res> {
  __$$WorkoutTransitionFeedbackImplCopyWithImpl(
    _$WorkoutTransitionFeedbackImpl _value,
    $Res Function(_$WorkoutTransitionFeedbackImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutTransition
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$WorkoutTransitionFeedbackImpl implements WorkoutTransitionFeedback {
  const _$WorkoutTransitionFeedbackImpl({final String? $type})
    : $type = $type ?? 'feedback';

  factory _$WorkoutTransitionFeedbackImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutTransitionFeedbackImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'WorkoutTransition.feedback()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutTransitionFeedbackImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration restDuration) rest,
    required TResult Function() feedback,
  }) {
    return feedback();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration restDuration)? rest,
    TResult? Function()? feedback,
  }) {
    return feedback?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration restDuration)? rest,
    TResult Function()? feedback,
    required TResult orElse(),
  }) {
    if (feedback != null) {
      return feedback();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkoutTransitionRest value) rest,
    required TResult Function(WorkoutTransitionFeedback value) feedback,
  }) {
    return feedback(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkoutTransitionRest value)? rest,
    TResult? Function(WorkoutTransitionFeedback value)? feedback,
  }) {
    return feedback?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkoutTransitionRest value)? rest,
    TResult Function(WorkoutTransitionFeedback value)? feedback,
    required TResult orElse(),
  }) {
    if (feedback != null) {
      return feedback(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutTransitionFeedbackImplToJson(this);
  }
}

abstract class WorkoutTransitionFeedback implements WorkoutTransition {
  const factory WorkoutTransitionFeedback() = _$WorkoutTransitionFeedbackImpl;

  factory WorkoutTransitionFeedback.fromJson(Map<String, dynamic> json) =
      _$WorkoutTransitionFeedbackImpl.fromJson;
}
