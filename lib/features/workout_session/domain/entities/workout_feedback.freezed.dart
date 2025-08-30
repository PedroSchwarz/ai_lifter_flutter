// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_feedback.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkoutFeedback _$WorkoutFeedbackFromJson(Map<String, dynamic> json) {
  return _WorkoutFeedback.fromJson(json);
}

/// @nodoc
mixin _$WorkoutFeedback {
  ExerciseRecommendation get exercise => throw _privateConstructorUsedError;
  int get set => throw _privateConstructorUsedError;
  WorkoutFeedbackPerformance get performance =>
      throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this WorkoutFeedback to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutFeedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutFeedbackCopyWith<WorkoutFeedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutFeedbackCopyWith<$Res> {
  factory $WorkoutFeedbackCopyWith(
    WorkoutFeedback value,
    $Res Function(WorkoutFeedback) then,
  ) = _$WorkoutFeedbackCopyWithImpl<$Res, WorkoutFeedback>;
  @useResult
  $Res call({
    ExerciseRecommendation exercise,
    int set,
    WorkoutFeedbackPerformance performance,
    DateTime timestamp,
  });

  $ExerciseRecommendationCopyWith<$Res> get exercise;
}

/// @nodoc
class _$WorkoutFeedbackCopyWithImpl<$Res, $Val extends WorkoutFeedback>
    implements $WorkoutFeedbackCopyWith<$Res> {
  _$WorkoutFeedbackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutFeedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercise = null,
    Object? set = null,
    Object? performance = null,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            exercise:
                null == exercise
                    ? _value.exercise
                    : exercise // ignore: cast_nullable_to_non_nullable
                        as ExerciseRecommendation,
            set:
                null == set
                    ? _value.set
                    : set // ignore: cast_nullable_to_non_nullable
                        as int,
            performance:
                null == performance
                    ? _value.performance
                    : performance // ignore: cast_nullable_to_non_nullable
                        as WorkoutFeedbackPerformance,
            timestamp:
                null == timestamp
                    ? _value.timestamp
                    : timestamp // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of WorkoutFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExerciseRecommendationCopyWith<$Res> get exercise {
    return $ExerciseRecommendationCopyWith<$Res>(_value.exercise, (value) {
      return _then(_value.copyWith(exercise: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkoutFeedbackImplCopyWith<$Res>
    implements $WorkoutFeedbackCopyWith<$Res> {
  factory _$$WorkoutFeedbackImplCopyWith(
    _$WorkoutFeedbackImpl value,
    $Res Function(_$WorkoutFeedbackImpl) then,
  ) = __$$WorkoutFeedbackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ExerciseRecommendation exercise,
    int set,
    WorkoutFeedbackPerformance performance,
    DateTime timestamp,
  });

  @override
  $ExerciseRecommendationCopyWith<$Res> get exercise;
}

/// @nodoc
class __$$WorkoutFeedbackImplCopyWithImpl<$Res>
    extends _$WorkoutFeedbackCopyWithImpl<$Res, _$WorkoutFeedbackImpl>
    implements _$$WorkoutFeedbackImplCopyWith<$Res> {
  __$$WorkoutFeedbackImplCopyWithImpl(
    _$WorkoutFeedbackImpl _value,
    $Res Function(_$WorkoutFeedbackImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutFeedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercise = null,
    Object? set = null,
    Object? performance = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$WorkoutFeedbackImpl(
        exercise:
            null == exercise
                ? _value.exercise
                : exercise // ignore: cast_nullable_to_non_nullable
                    as ExerciseRecommendation,
        set:
            null == set
                ? _value.set
                : set // ignore: cast_nullable_to_non_nullable
                    as int,
        performance:
            null == performance
                ? _value.performance
                : performance // ignore: cast_nullable_to_non_nullable
                    as WorkoutFeedbackPerformance,
        timestamp:
            null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutFeedbackImpl implements _WorkoutFeedback {
  const _$WorkoutFeedbackImpl({
    required this.exercise,
    required this.set,
    required this.performance,
    required this.timestamp,
  });

  factory _$WorkoutFeedbackImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutFeedbackImplFromJson(json);

  @override
  final ExerciseRecommendation exercise;
  @override
  final int set;
  @override
  final WorkoutFeedbackPerformance performance;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'WorkoutFeedback(exercise: $exercise, set: $set, performance: $performance, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutFeedbackImpl &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.set, set) || other.set == set) &&
            (identical(other.performance, performance) ||
                other.performance == performance) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, exercise, set, performance, timestamp);

  /// Create a copy of WorkoutFeedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutFeedbackImplCopyWith<_$WorkoutFeedbackImpl> get copyWith =>
      __$$WorkoutFeedbackImplCopyWithImpl<_$WorkoutFeedbackImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutFeedbackImplToJson(this);
  }
}

abstract class _WorkoutFeedback implements WorkoutFeedback {
  const factory _WorkoutFeedback({
    required final ExerciseRecommendation exercise,
    required final int set,
    required final WorkoutFeedbackPerformance performance,
    required final DateTime timestamp,
  }) = _$WorkoutFeedbackImpl;

  factory _WorkoutFeedback.fromJson(Map<String, dynamic> json) =
      _$WorkoutFeedbackImpl.fromJson;

  @override
  ExerciseRecommendation get exercise;
  @override
  int get set;
  @override
  WorkoutFeedbackPerformance get performance;
  @override
  DateTime get timestamp;

  /// Create a copy of WorkoutFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutFeedbackImplCopyWith<_$WorkoutFeedbackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
