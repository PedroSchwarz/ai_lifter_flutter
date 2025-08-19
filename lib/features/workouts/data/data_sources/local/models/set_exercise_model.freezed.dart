// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_exercise_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SetWithExercise {
  WorkoutSet get set => throw _privateConstructorUsedError;
  Exercise? get exercise => throw _privateConstructorUsedError;

  /// Create a copy of SetWithExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SetWithExerciseCopyWith<SetWithExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetWithExerciseCopyWith<$Res> {
  factory $SetWithExerciseCopyWith(
    SetWithExercise value,
    $Res Function(SetWithExercise) then,
  ) = _$SetWithExerciseCopyWithImpl<$Res, SetWithExercise>;
  @useResult
  $Res call({WorkoutSet set, Exercise? exercise});
}

/// @nodoc
class _$SetWithExerciseCopyWithImpl<$Res, $Val extends SetWithExercise>
    implements $SetWithExerciseCopyWith<$Res> {
  _$SetWithExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SetWithExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? set = freezed, Object? exercise = freezed}) {
    return _then(
      _value.copyWith(
            set:
                freezed == set
                    ? _value.set
                    : set // ignore: cast_nullable_to_non_nullable
                        as WorkoutSet,
            exercise:
                freezed == exercise
                    ? _value.exercise
                    : exercise // ignore: cast_nullable_to_non_nullable
                        as Exercise?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SetWithExerciseImplCopyWith<$Res>
    implements $SetWithExerciseCopyWith<$Res> {
  factory _$$SetWithExerciseImplCopyWith(
    _$SetWithExerciseImpl value,
    $Res Function(_$SetWithExerciseImpl) then,
  ) = __$$SetWithExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WorkoutSet set, Exercise? exercise});
}

/// @nodoc
class __$$SetWithExerciseImplCopyWithImpl<$Res>
    extends _$SetWithExerciseCopyWithImpl<$Res, _$SetWithExerciseImpl>
    implements _$$SetWithExerciseImplCopyWith<$Res> {
  __$$SetWithExerciseImplCopyWithImpl(
    _$SetWithExerciseImpl _value,
    $Res Function(_$SetWithExerciseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SetWithExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? set = freezed, Object? exercise = freezed}) {
    return _then(
      _$SetWithExerciseImpl(
        set:
            freezed == set
                ? _value.set
                : set // ignore: cast_nullable_to_non_nullable
                    as WorkoutSet,
        exercise:
            freezed == exercise
                ? _value.exercise
                : exercise // ignore: cast_nullable_to_non_nullable
                    as Exercise?,
      ),
    );
  }
}

/// @nodoc

class _$SetWithExerciseImpl implements _SetWithExercise {
  const _$SetWithExerciseImpl({required this.set, this.exercise});

  @override
  final WorkoutSet set;
  @override
  final Exercise? exercise;

  @override
  String toString() {
    return 'SetWithExercise(set: $set, exercise: $exercise)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetWithExerciseImpl &&
            const DeepCollectionEquality().equals(other.set, set) &&
            const DeepCollectionEquality().equals(other.exercise, exercise));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(set),
    const DeepCollectionEquality().hash(exercise),
  );

  /// Create a copy of SetWithExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetWithExerciseImplCopyWith<_$SetWithExerciseImpl> get copyWith =>
      __$$SetWithExerciseImplCopyWithImpl<_$SetWithExerciseImpl>(
        this,
        _$identity,
      );
}

abstract class _SetWithExercise implements SetWithExercise {
  const factory _SetWithExercise({
    required final WorkoutSet set,
    final Exercise? exercise,
  }) = _$SetWithExerciseImpl;

  @override
  WorkoutSet get set;
  @override
  Exercise? get exercise;

  /// Create a copy of SetWithExercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetWithExerciseImplCopyWith<_$SetWithExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
