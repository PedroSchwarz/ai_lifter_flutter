// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WorkoutSessionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
      WorkoutPlan workoutPlan,
      WorkoutStep currentStep,
      int currentStepIndex,
      WorkoutStepExercise nextExercise,
      bool isRestingPaused,
      bool hasSessionFinished,
      Set<WorkoutFeedback> workoutFeedbacks,
    )
    loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
      WorkoutPlan workoutPlan,
      WorkoutStep currentStep,
      int currentStepIndex,
      WorkoutStepExercise nextExercise,
      bool isRestingPaused,
      bool hasSessionFinished,
      Set<WorkoutFeedback> workoutFeedbacks,
    )?
    loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
      WorkoutPlan workoutPlan,
      WorkoutStep currentStep,
      int currentStepIndex,
      WorkoutStepExercise nextExercise,
      bool isRestingPaused,
      bool hasSessionFinished,
      Set<WorkoutFeedback> workoutFeedbacks,
    )?
    loaded,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkoutSessionStarted value) started,
    required TResult Function(WorkoutSessionLoaded value) loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkoutSessionStarted value)? started,
    TResult? Function(WorkoutSessionLoaded value)? loaded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkoutSessionStarted value)? started,
    TResult Function(WorkoutSessionLoaded value)? loaded,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSessionStateCopyWith<$Res> {
  factory $WorkoutSessionStateCopyWith(
    WorkoutSessionState value,
    $Res Function(WorkoutSessionState) then,
  ) = _$WorkoutSessionStateCopyWithImpl<$Res, WorkoutSessionState>;
}

/// @nodoc
class _$WorkoutSessionStateCopyWithImpl<$Res, $Val extends WorkoutSessionState>
    implements $WorkoutSessionStateCopyWith<$Res> {
  _$WorkoutSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$WorkoutSessionStartedImplCopyWith<$Res> {
  factory _$$WorkoutSessionStartedImplCopyWith(
    _$WorkoutSessionStartedImpl value,
    $Res Function(_$WorkoutSessionStartedImpl) then,
  ) = __$$WorkoutSessionStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WorkoutSessionStartedImplCopyWithImpl<$Res>
    extends _$WorkoutSessionStateCopyWithImpl<$Res, _$WorkoutSessionStartedImpl>
    implements _$$WorkoutSessionStartedImplCopyWith<$Res> {
  __$$WorkoutSessionStartedImplCopyWithImpl(
    _$WorkoutSessionStartedImpl _value,
    $Res Function(_$WorkoutSessionStartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$WorkoutSessionStartedImpl extends WorkoutSessionStarted {
  const _$WorkoutSessionStartedImpl() : super._();

  @override
  String toString() {
    return 'WorkoutSessionState.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSessionStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
      WorkoutPlan workoutPlan,
      WorkoutStep currentStep,
      int currentStepIndex,
      WorkoutStepExercise nextExercise,
      bool isRestingPaused,
      bool hasSessionFinished,
      Set<WorkoutFeedback> workoutFeedbacks,
    )
    loaded,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
      WorkoutPlan workoutPlan,
      WorkoutStep currentStep,
      int currentStepIndex,
      WorkoutStepExercise nextExercise,
      bool isRestingPaused,
      bool hasSessionFinished,
      Set<WorkoutFeedback> workoutFeedbacks,
    )?
    loaded,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
      WorkoutPlan workoutPlan,
      WorkoutStep currentStep,
      int currentStepIndex,
      WorkoutStepExercise nextExercise,
      bool isRestingPaused,
      bool hasSessionFinished,
      Set<WorkoutFeedback> workoutFeedbacks,
    )?
    loaded,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkoutSessionStarted value) started,
    required TResult Function(WorkoutSessionLoaded value) loaded,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkoutSessionStarted value)? started,
    TResult? Function(WorkoutSessionLoaded value)? loaded,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkoutSessionStarted value)? started,
    TResult Function(WorkoutSessionLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class WorkoutSessionStarted extends WorkoutSessionState {
  const factory WorkoutSessionStarted() = _$WorkoutSessionStartedImpl;
  const WorkoutSessionStarted._() : super._();
}

/// @nodoc
abstract class _$$WorkoutSessionLoadedImplCopyWith<$Res> {
  factory _$$WorkoutSessionLoadedImplCopyWith(
    _$WorkoutSessionLoadedImpl value,
    $Res Function(_$WorkoutSessionLoadedImpl) then,
  ) = __$$WorkoutSessionLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    WorkoutPlan workoutPlan,
    WorkoutStep currentStep,
    int currentStepIndex,
    WorkoutStepExercise nextExercise,
    bool isRestingPaused,
    bool hasSessionFinished,
    Set<WorkoutFeedback> workoutFeedbacks,
  });

  $WorkoutPlanCopyWith<$Res> get workoutPlan;
  $WorkoutStepCopyWith<$Res> get currentStep;
}

/// @nodoc
class __$$WorkoutSessionLoadedImplCopyWithImpl<$Res>
    extends _$WorkoutSessionStateCopyWithImpl<$Res, _$WorkoutSessionLoadedImpl>
    implements _$$WorkoutSessionLoadedImplCopyWith<$Res> {
  __$$WorkoutSessionLoadedImplCopyWithImpl(
    _$WorkoutSessionLoadedImpl _value,
    $Res Function(_$WorkoutSessionLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workoutPlan = null,
    Object? currentStep = null,
    Object? currentStepIndex = null,
    Object? nextExercise = freezed,
    Object? isRestingPaused = null,
    Object? hasSessionFinished = null,
    Object? workoutFeedbacks = null,
  }) {
    return _then(
      _$WorkoutSessionLoadedImpl(
        workoutPlan:
            null == workoutPlan
                ? _value.workoutPlan
                : workoutPlan // ignore: cast_nullable_to_non_nullable
                    as WorkoutPlan,
        currentStep:
            null == currentStep
                ? _value.currentStep
                : currentStep // ignore: cast_nullable_to_non_nullable
                    as WorkoutStep,
        currentStepIndex:
            null == currentStepIndex
                ? _value.currentStepIndex
                : currentStepIndex // ignore: cast_nullable_to_non_nullable
                    as int,
        nextExercise:
            freezed == nextExercise
                ? _value.nextExercise
                : nextExercise // ignore: cast_nullable_to_non_nullable
                    as WorkoutStepExercise,
        isRestingPaused:
            null == isRestingPaused
                ? _value.isRestingPaused
                : isRestingPaused // ignore: cast_nullable_to_non_nullable
                    as bool,
        hasSessionFinished:
            null == hasSessionFinished
                ? _value.hasSessionFinished
                : hasSessionFinished // ignore: cast_nullable_to_non_nullable
                    as bool,
        workoutFeedbacks:
            null == workoutFeedbacks
                ? _value._workoutFeedbacks
                : workoutFeedbacks // ignore: cast_nullable_to_non_nullable
                    as Set<WorkoutFeedback>,
      ),
    );
  }

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkoutPlanCopyWith<$Res> get workoutPlan {
    return $WorkoutPlanCopyWith<$Res>(_value.workoutPlan, (value) {
      return _then(_value.copyWith(workoutPlan: value));
    });
  }

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkoutStepCopyWith<$Res> get currentStep {
    return $WorkoutStepCopyWith<$Res>(_value.currentStep, (value) {
      return _then(_value.copyWith(currentStep: value));
    });
  }
}

/// @nodoc

class _$WorkoutSessionLoadedImpl extends WorkoutSessionLoaded {
  const _$WorkoutSessionLoadedImpl({
    required this.workoutPlan,
    required this.currentStep,
    required this.currentStepIndex,
    required this.nextExercise,
    required this.isRestingPaused,
    required this.hasSessionFinished,
    required final Set<WorkoutFeedback> workoutFeedbacks,
  }) : _workoutFeedbacks = workoutFeedbacks,
       super._();

  @override
  final WorkoutPlan workoutPlan;
  @override
  final WorkoutStep currentStep;
  @override
  final int currentStepIndex;
  @override
  final WorkoutStepExercise nextExercise;
  @override
  final bool isRestingPaused;
  @override
  final bool hasSessionFinished;
  final Set<WorkoutFeedback> _workoutFeedbacks;
  @override
  Set<WorkoutFeedback> get workoutFeedbacks {
    if (_workoutFeedbacks is EqualUnmodifiableSetView) return _workoutFeedbacks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_workoutFeedbacks);
  }

  @override
  String toString() {
    return 'WorkoutSessionState.loaded(workoutPlan: $workoutPlan, currentStep: $currentStep, currentStepIndex: $currentStepIndex, nextExercise: $nextExercise, isRestingPaused: $isRestingPaused, hasSessionFinished: $hasSessionFinished, workoutFeedbacks: $workoutFeedbacks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSessionLoadedImpl &&
            (identical(other.workoutPlan, workoutPlan) ||
                other.workoutPlan == workoutPlan) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.currentStepIndex, currentStepIndex) ||
                other.currentStepIndex == currentStepIndex) &&
            const DeepCollectionEquality().equals(
              other.nextExercise,
              nextExercise,
            ) &&
            (identical(other.isRestingPaused, isRestingPaused) ||
                other.isRestingPaused == isRestingPaused) &&
            (identical(other.hasSessionFinished, hasSessionFinished) ||
                other.hasSessionFinished == hasSessionFinished) &&
            const DeepCollectionEquality().equals(
              other._workoutFeedbacks,
              _workoutFeedbacks,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    workoutPlan,
    currentStep,
    currentStepIndex,
    const DeepCollectionEquality().hash(nextExercise),
    isRestingPaused,
    hasSessionFinished,
    const DeepCollectionEquality().hash(_workoutFeedbacks),
  );

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSessionLoadedImplCopyWith<_$WorkoutSessionLoadedImpl>
  get copyWith =>
      __$$WorkoutSessionLoadedImplCopyWithImpl<_$WorkoutSessionLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
      WorkoutPlan workoutPlan,
      WorkoutStep currentStep,
      int currentStepIndex,
      WorkoutStepExercise nextExercise,
      bool isRestingPaused,
      bool hasSessionFinished,
      Set<WorkoutFeedback> workoutFeedbacks,
    )
    loaded,
  }) {
    return loaded(
      workoutPlan,
      currentStep,
      currentStepIndex,
      nextExercise,
      isRestingPaused,
      hasSessionFinished,
      workoutFeedbacks,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
      WorkoutPlan workoutPlan,
      WorkoutStep currentStep,
      int currentStepIndex,
      WorkoutStepExercise nextExercise,
      bool isRestingPaused,
      bool hasSessionFinished,
      Set<WorkoutFeedback> workoutFeedbacks,
    )?
    loaded,
  }) {
    return loaded?.call(
      workoutPlan,
      currentStep,
      currentStepIndex,
      nextExercise,
      isRestingPaused,
      hasSessionFinished,
      workoutFeedbacks,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
      WorkoutPlan workoutPlan,
      WorkoutStep currentStep,
      int currentStepIndex,
      WorkoutStepExercise nextExercise,
      bool isRestingPaused,
      bool hasSessionFinished,
      Set<WorkoutFeedback> workoutFeedbacks,
    )?
    loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
        workoutPlan,
        currentStep,
        currentStepIndex,
        nextExercise,
        isRestingPaused,
        hasSessionFinished,
        workoutFeedbacks,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkoutSessionStarted value) started,
    required TResult Function(WorkoutSessionLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkoutSessionStarted value)? started,
    TResult? Function(WorkoutSessionLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkoutSessionStarted value)? started,
    TResult Function(WorkoutSessionLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class WorkoutSessionLoaded extends WorkoutSessionState {
  const factory WorkoutSessionLoaded({
    required final WorkoutPlan workoutPlan,
    required final WorkoutStep currentStep,
    required final int currentStepIndex,
    required final WorkoutStepExercise nextExercise,
    required final bool isRestingPaused,
    required final bool hasSessionFinished,
    required final Set<WorkoutFeedback> workoutFeedbacks,
  }) = _$WorkoutSessionLoadedImpl;
  const WorkoutSessionLoaded._() : super._();

  WorkoutPlan get workoutPlan;
  WorkoutStep get currentStep;
  int get currentStepIndex;
  WorkoutStepExercise get nextExercise;
  bool get isRestingPaused;
  bool get hasSessionFinished;
  Set<WorkoutFeedback> get workoutFeedbacks;

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSessionLoadedImplCopyWith<_$WorkoutSessionLoadedImpl>
  get copyWith => throw _privateConstructorUsedError;
}
