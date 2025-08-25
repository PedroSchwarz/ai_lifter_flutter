// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workouts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WorkoutsState {
  List<Exercise> get exercises => throw _privateConstructorUsedError;
  List<Workout> get workouts => throw _privateConstructorUsedError;
  List<SetWithExercise> get currentWorkoutSets =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  Workout? get selectedWorkout => throw _privateConstructorUsedError;
  Exercise? get selectedExercise => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutsStateCopyWith<WorkoutsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutsStateCopyWith<$Res> {
  factory $WorkoutsStateCopyWith(
    WorkoutsState value,
    $Res Function(WorkoutsState) then,
  ) = _$WorkoutsStateCopyWithImpl<$Res, WorkoutsState>;
  @useResult
  $Res call({
    List<Exercise> exercises,
    List<Workout> workouts,
    List<SetWithExercise> currentWorkoutSets,
    bool isLoading,
    String? error,
    Workout? selectedWorkout,
    Exercise? selectedExercise,
  });
}

/// @nodoc
class _$WorkoutsStateCopyWithImpl<$Res, $Val extends WorkoutsState>
    implements $WorkoutsStateCopyWith<$Res> {
  _$WorkoutsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercises = null,
    Object? workouts = null,
    Object? currentWorkoutSets = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? selectedWorkout = freezed,
    Object? selectedExercise = freezed,
  }) {
    return _then(
      _value.copyWith(
            exercises:
                null == exercises
                    ? _value.exercises
                    : exercises // ignore: cast_nullable_to_non_nullable
                        as List<Exercise>,
            workouts:
                null == workouts
                    ? _value.workouts
                    : workouts // ignore: cast_nullable_to_non_nullable
                        as List<Workout>,
            currentWorkoutSets:
                null == currentWorkoutSets
                    ? _value.currentWorkoutSets
                    : currentWorkoutSets // ignore: cast_nullable_to_non_nullable
                        as List<SetWithExercise>,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
            selectedWorkout:
                freezed == selectedWorkout
                    ? _value.selectedWorkout
                    : selectedWorkout // ignore: cast_nullable_to_non_nullable
                        as Workout?,
            selectedExercise:
                freezed == selectedExercise
                    ? _value.selectedExercise
                    : selectedExercise // ignore: cast_nullable_to_non_nullable
                        as Exercise?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutsStateImplCopyWith<$Res>
    implements $WorkoutsStateCopyWith<$Res> {
  factory _$$WorkoutsStateImplCopyWith(
    _$WorkoutsStateImpl value,
    $Res Function(_$WorkoutsStateImpl) then,
  ) = __$$WorkoutsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Exercise> exercises,
    List<Workout> workouts,
    List<SetWithExercise> currentWorkoutSets,
    bool isLoading,
    String? error,
    Workout? selectedWorkout,
    Exercise? selectedExercise,
  });
}

/// @nodoc
class __$$WorkoutsStateImplCopyWithImpl<$Res>
    extends _$WorkoutsStateCopyWithImpl<$Res, _$WorkoutsStateImpl>
    implements _$$WorkoutsStateImplCopyWith<$Res> {
  __$$WorkoutsStateImplCopyWithImpl(
    _$WorkoutsStateImpl _value,
    $Res Function(_$WorkoutsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercises = null,
    Object? workouts = null,
    Object? currentWorkoutSets = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? selectedWorkout = freezed,
    Object? selectedExercise = freezed,
  }) {
    return _then(
      _$WorkoutsStateImpl(
        exercises:
            null == exercises
                ? _value._exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                    as List<Exercise>,
        workouts:
            null == workouts
                ? _value._workouts
                : workouts // ignore: cast_nullable_to_non_nullable
                    as List<Workout>,
        currentWorkoutSets:
            null == currentWorkoutSets
                ? _value._currentWorkoutSets
                : currentWorkoutSets // ignore: cast_nullable_to_non_nullable
                    as List<SetWithExercise>,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
        selectedWorkout:
            freezed == selectedWorkout
                ? _value.selectedWorkout
                : selectedWorkout // ignore: cast_nullable_to_non_nullable
                    as Workout?,
        selectedExercise:
            freezed == selectedExercise
                ? _value.selectedExercise
                : selectedExercise // ignore: cast_nullable_to_non_nullable
                    as Exercise?,
      ),
    );
  }
}

/// @nodoc

class _$WorkoutsStateImpl extends _WorkoutsState {
  const _$WorkoutsStateImpl({
    required final List<Exercise> exercises,
    required final List<Workout> workouts,
    required final List<SetWithExercise> currentWorkoutSets,
    required this.isLoading,
    this.error,
    this.selectedWorkout,
    this.selectedExercise,
  }) : _exercises = exercises,
       _workouts = workouts,
       _currentWorkoutSets = currentWorkoutSets,
       super._();

  final List<Exercise> _exercises;
  @override
  List<Exercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  final List<Workout> _workouts;
  @override
  List<Workout> get workouts {
    if (_workouts is EqualUnmodifiableListView) return _workouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workouts);
  }

  final List<SetWithExercise> _currentWorkoutSets;
  @override
  List<SetWithExercise> get currentWorkoutSets {
    if (_currentWorkoutSets is EqualUnmodifiableListView)
      return _currentWorkoutSets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentWorkoutSets);
  }

  @override
  final bool isLoading;
  @override
  final String? error;
  @override
  final Workout? selectedWorkout;
  @override
  final Exercise? selectedExercise;

  @override
  String toString() {
    return 'WorkoutsState(exercises: $exercises, workouts: $workouts, currentWorkoutSets: $currentWorkoutSets, isLoading: $isLoading, error: $error, selectedWorkout: $selectedWorkout, selectedExercise: $selectedExercise)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutsStateImpl &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ) &&
            const DeepCollectionEquality().equals(other._workouts, _workouts) &&
            const DeepCollectionEquality().equals(
              other._currentWorkoutSets,
              _currentWorkoutSets,
            ) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(
              other.selectedWorkout,
              selectedWorkout,
            ) &&
            const DeepCollectionEquality().equals(
              other.selectedExercise,
              selectedExercise,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_exercises),
    const DeepCollectionEquality().hash(_workouts),
    const DeepCollectionEquality().hash(_currentWorkoutSets),
    isLoading,
    error,
    const DeepCollectionEquality().hash(selectedWorkout),
    const DeepCollectionEquality().hash(selectedExercise),
  );

  /// Create a copy of WorkoutsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutsStateImplCopyWith<_$WorkoutsStateImpl> get copyWith =>
      __$$WorkoutsStateImplCopyWithImpl<_$WorkoutsStateImpl>(this, _$identity);
}

abstract class _WorkoutsState extends WorkoutsState {
  const factory _WorkoutsState({
    required final List<Exercise> exercises,
    required final List<Workout> workouts,
    required final List<SetWithExercise> currentWorkoutSets,
    required final bool isLoading,
    final String? error,
    final Workout? selectedWorkout,
    final Exercise? selectedExercise,
  }) = _$WorkoutsStateImpl;
  const _WorkoutsState._() : super._();

  @override
  List<Exercise> get exercises;
  @override
  List<Workout> get workouts;
  @override
  List<SetWithExercise> get currentWorkoutSets;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  Workout? get selectedWorkout;
  @override
  Exercise? get selectedExercise;

  /// Create a copy of WorkoutsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutsStateImplCopyWith<_$WorkoutsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
