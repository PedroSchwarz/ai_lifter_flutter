// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ExerciseRecommendation _$ExerciseRecommendationFromJson(
  Map<String, dynamic> json,
) {
  return _ExerciseRecommendation.fromJson(json);
}

/// @nodoc
mixin _$ExerciseRecommendation {
  int get exerciseId => throw _privateConstructorUsedError;
  String get exerciseName => throw _privateConstructorUsedError;
  ExerciseType get exerciseType => throw _privateConstructorUsedError;
  int get sets => throw _privateConstructorUsedError;
  int get reps => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  int? get restSeconds => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this ExerciseRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseRecommendationCopyWith<ExerciseRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseRecommendationCopyWith<$Res> {
  factory $ExerciseRecommendationCopyWith(
    ExerciseRecommendation value,
    $Res Function(ExerciseRecommendation) then,
  ) = _$ExerciseRecommendationCopyWithImpl<$Res, ExerciseRecommendation>;
  @useResult
  $Res call({
    int exerciseId,
    String exerciseName,
    ExerciseType exerciseType,
    int sets,
    int reps,
    double? weight,
    int? restSeconds,
    String? notes,
  });
}

/// @nodoc
class _$ExerciseRecommendationCopyWithImpl<
  $Res,
  $Val extends ExerciseRecommendation
>
    implements $ExerciseRecommendationCopyWith<$Res> {
  _$ExerciseRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? exerciseName = null,
    Object? exerciseType = null,
    Object? sets = null,
    Object? reps = null,
    Object? weight = freezed,
    Object? restSeconds = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            exerciseId:
                null == exerciseId
                    ? _value.exerciseId
                    : exerciseId // ignore: cast_nullable_to_non_nullable
                        as int,
            exerciseName:
                null == exerciseName
                    ? _value.exerciseName
                    : exerciseName // ignore: cast_nullable_to_non_nullable
                        as String,
            exerciseType:
                null == exerciseType
                    ? _value.exerciseType
                    : exerciseType // ignore: cast_nullable_to_non_nullable
                        as ExerciseType,
            sets:
                null == sets
                    ? _value.sets
                    : sets // ignore: cast_nullable_to_non_nullable
                        as int,
            reps:
                null == reps
                    ? _value.reps
                    : reps // ignore: cast_nullable_to_non_nullable
                        as int,
            weight:
                freezed == weight
                    ? _value.weight
                    : weight // ignore: cast_nullable_to_non_nullable
                        as double?,
            restSeconds:
                freezed == restSeconds
                    ? _value.restSeconds
                    : restSeconds // ignore: cast_nullable_to_non_nullable
                        as int?,
            notes:
                freezed == notes
                    ? _value.notes
                    : notes // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExerciseRecommendationImplCopyWith<$Res>
    implements $ExerciseRecommendationCopyWith<$Res> {
  factory _$$ExerciseRecommendationImplCopyWith(
    _$ExerciseRecommendationImpl value,
    $Res Function(_$ExerciseRecommendationImpl) then,
  ) = __$$ExerciseRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int exerciseId,
    String exerciseName,
    ExerciseType exerciseType,
    int sets,
    int reps,
    double? weight,
    int? restSeconds,
    String? notes,
  });
}

/// @nodoc
class __$$ExerciseRecommendationImplCopyWithImpl<$Res>
    extends
        _$ExerciseRecommendationCopyWithImpl<$Res, _$ExerciseRecommendationImpl>
    implements _$$ExerciseRecommendationImplCopyWith<$Res> {
  __$$ExerciseRecommendationImplCopyWithImpl(
    _$ExerciseRecommendationImpl _value,
    $Res Function(_$ExerciseRecommendationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExerciseRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? exerciseName = null,
    Object? exerciseType = null,
    Object? sets = null,
    Object? reps = null,
    Object? weight = freezed,
    Object? restSeconds = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$ExerciseRecommendationImpl(
        exerciseId:
            null == exerciseId
                ? _value.exerciseId
                : exerciseId // ignore: cast_nullable_to_non_nullable
                    as int,
        exerciseName:
            null == exerciseName
                ? _value.exerciseName
                : exerciseName // ignore: cast_nullable_to_non_nullable
                    as String,
        exerciseType:
            null == exerciseType
                ? _value.exerciseType
                : exerciseType // ignore: cast_nullable_to_non_nullable
                    as ExerciseType,
        sets:
            null == sets
                ? _value.sets
                : sets // ignore: cast_nullable_to_non_nullable
                    as int,
        reps:
            null == reps
                ? _value.reps
                : reps // ignore: cast_nullable_to_non_nullable
                    as int,
        weight:
            freezed == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                    as double?,
        restSeconds:
            freezed == restSeconds
                ? _value.restSeconds
                : restSeconds // ignore: cast_nullable_to_non_nullable
                    as int?,
        notes:
            freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseRecommendationImpl implements _ExerciseRecommendation {
  const _$ExerciseRecommendationImpl({
    required this.exerciseId,
    required this.exerciseName,
    required this.exerciseType,
    required this.sets,
    required this.reps,
    this.weight,
    this.restSeconds,
    this.notes,
  });

  factory _$ExerciseRecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseRecommendationImplFromJson(json);

  @override
  final int exerciseId;
  @override
  final String exerciseName;
  @override
  final ExerciseType exerciseType;
  @override
  final int sets;
  @override
  final int reps;
  @override
  final double? weight;
  @override
  final int? restSeconds;
  @override
  final String? notes;

  @override
  String toString() {
    return 'ExerciseRecommendation(exerciseId: $exerciseId, exerciseName: $exerciseName, exerciseType: $exerciseType, sets: $sets, reps: $reps, weight: $weight, restSeconds: $restSeconds, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseRecommendationImpl &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            (identical(other.exerciseType, exerciseType) ||
                other.exerciseType == exerciseType) &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.restSeconds, restSeconds) ||
                other.restSeconds == restSeconds) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    exerciseId,
    exerciseName,
    exerciseType,
    sets,
    reps,
    weight,
    restSeconds,
    notes,
  );

  /// Create a copy of ExerciseRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseRecommendationImplCopyWith<_$ExerciseRecommendationImpl>
  get copyWith =>
      __$$ExerciseRecommendationImplCopyWithImpl<_$ExerciseRecommendationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseRecommendationImplToJson(this);
  }
}

abstract class _ExerciseRecommendation implements ExerciseRecommendation {
  const factory _ExerciseRecommendation({
    required final int exerciseId,
    required final String exerciseName,
    required final ExerciseType exerciseType,
    required final int sets,
    required final int reps,
    final double? weight,
    final int? restSeconds,
    final String? notes,
  }) = _$ExerciseRecommendationImpl;

  factory _ExerciseRecommendation.fromJson(Map<String, dynamic> json) =
      _$ExerciseRecommendationImpl.fromJson;

  @override
  int get exerciseId;
  @override
  String get exerciseName;
  @override
  ExerciseType get exerciseType;
  @override
  int get sets;
  @override
  int get reps;
  @override
  double? get weight;
  @override
  int? get restSeconds;
  @override
  String? get notes;

  /// Create a copy of ExerciseRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseRecommendationImplCopyWith<_$ExerciseRecommendationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

WorkoutPlan _$WorkoutPlanFromJson(Map<String, dynamic> json) {
  return _WorkoutPlan.fromJson(json);
}

/// @nodoc
mixin _$WorkoutPlan {
  String get name => throw _privateConstructorUsedError;
  WorkoutPlanType get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<WorkoutStep> get steps => throw _privateConstructorUsedError;
  int get totalDurationInMinutes => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this WorkoutPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutPlanCopyWith<WorkoutPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutPlanCopyWith<$Res> {
  factory $WorkoutPlanCopyWith(
    WorkoutPlan value,
    $Res Function(WorkoutPlan) then,
  ) = _$WorkoutPlanCopyWithImpl<$Res, WorkoutPlan>;
  @useResult
  $Res call({
    String name,
    WorkoutPlanType type,
    String description,
    List<WorkoutStep> steps,
    int totalDurationInMinutes,
    String? notes,
  });
}

/// @nodoc
class _$WorkoutPlanCopyWithImpl<$Res, $Val extends WorkoutPlan>
    implements $WorkoutPlanCopyWith<$Res> {
  _$WorkoutPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? description = null,
    Object? steps = null,
    Object? totalDurationInMinutes = null,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as WorkoutPlanType,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            steps:
                null == steps
                    ? _value.steps
                    : steps // ignore: cast_nullable_to_non_nullable
                        as List<WorkoutStep>,
            totalDurationInMinutes:
                null == totalDurationInMinutes
                    ? _value.totalDurationInMinutes
                    : totalDurationInMinutes // ignore: cast_nullable_to_non_nullable
                        as int,
            notes:
                freezed == notes
                    ? _value.notes
                    : notes // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutPlanImplCopyWith<$Res>
    implements $WorkoutPlanCopyWith<$Res> {
  factory _$$WorkoutPlanImplCopyWith(
    _$WorkoutPlanImpl value,
    $Res Function(_$WorkoutPlanImpl) then,
  ) = __$$WorkoutPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    WorkoutPlanType type,
    String description,
    List<WorkoutStep> steps,
    int totalDurationInMinutes,
    String? notes,
  });
}

/// @nodoc
class __$$WorkoutPlanImplCopyWithImpl<$Res>
    extends _$WorkoutPlanCopyWithImpl<$Res, _$WorkoutPlanImpl>
    implements _$$WorkoutPlanImplCopyWith<$Res> {
  __$$WorkoutPlanImplCopyWithImpl(
    _$WorkoutPlanImpl _value,
    $Res Function(_$WorkoutPlanImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? description = null,
    Object? steps = null,
    Object? totalDurationInMinutes = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$WorkoutPlanImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as WorkoutPlanType,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        steps:
            null == steps
                ? _value._steps
                : steps // ignore: cast_nullable_to_non_nullable
                    as List<WorkoutStep>,
        totalDurationInMinutes:
            null == totalDurationInMinutes
                ? _value.totalDurationInMinutes
                : totalDurationInMinutes // ignore: cast_nullable_to_non_nullable
                    as int,
        notes:
            freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutPlanImpl implements _WorkoutPlan {
  const _$WorkoutPlanImpl({
    required this.name,
    required this.type,
    required this.description,
    required final List<WorkoutStep> steps,
    required this.totalDurationInMinutes,
    this.notes,
  }) : _steps = steps;

  factory _$WorkoutPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutPlanImplFromJson(json);

  @override
  final String name;
  @override
  final WorkoutPlanType type;
  @override
  final String description;
  final List<WorkoutStep> _steps;
  @override
  List<WorkoutStep> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  final int totalDurationInMinutes;
  @override
  final String? notes;

  @override
  String toString() {
    return 'WorkoutPlan(name: $name, type: $type, description: $description, steps: $steps, totalDurationInMinutes: $totalDurationInMinutes, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutPlanImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.totalDurationInMinutes, totalDurationInMinutes) ||
                other.totalDurationInMinutes == totalDurationInMinutes) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    type,
    description,
    const DeepCollectionEquality().hash(_steps),
    totalDurationInMinutes,
    notes,
  );

  /// Create a copy of WorkoutPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutPlanImplCopyWith<_$WorkoutPlanImpl> get copyWith =>
      __$$WorkoutPlanImplCopyWithImpl<_$WorkoutPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutPlanImplToJson(this);
  }
}

abstract class _WorkoutPlan implements WorkoutPlan {
  const factory _WorkoutPlan({
    required final String name,
    required final WorkoutPlanType type,
    required final String description,
    required final List<WorkoutStep> steps,
    required final int totalDurationInMinutes,
    final String? notes,
  }) = _$WorkoutPlanImpl;

  factory _WorkoutPlan.fromJson(Map<String, dynamic> json) =
      _$WorkoutPlanImpl.fromJson;

  @override
  String get name;
  @override
  WorkoutPlanType get type;
  @override
  String get description;
  @override
  List<WorkoutStep> get steps;
  @override
  int get totalDurationInMinutes;
  @override
  String? get notes;

  /// Create a copy of WorkoutPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutPlanImplCopyWith<_$WorkoutPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkoutPlanRequest _$WorkoutPlanRequestFromJson(Map<String, dynamic> json) {
  return _WorkoutPlanRequest.fromJson(json);
}

/// @nodoc
mixin _$WorkoutPlanRequest {
  WorkoutPlanType get planType => throw _privateConstructorUsedError;
  MuscleGroup get targetMuscleGroup => throw _privateConstructorUsedError;
  int get workoutDurationInMinutes => throw _privateConstructorUsedError;
  List<int> get availableExerciseIds => throw _privateConstructorUsedError;
  double? get userWeight => throw _privateConstructorUsedError;
  int? get userExperienceLevel => throw _privateConstructorUsedError;

  /// Serializes this WorkoutPlanRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutPlanRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutPlanRequestCopyWith<WorkoutPlanRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutPlanRequestCopyWith<$Res> {
  factory $WorkoutPlanRequestCopyWith(
    WorkoutPlanRequest value,
    $Res Function(WorkoutPlanRequest) then,
  ) = _$WorkoutPlanRequestCopyWithImpl<$Res, WorkoutPlanRequest>;
  @useResult
  $Res call({
    WorkoutPlanType planType,
    MuscleGroup targetMuscleGroup,
    int workoutDurationInMinutes,
    List<int> availableExerciseIds,
    double? userWeight,
    int? userExperienceLevel,
  });
}

/// @nodoc
class _$WorkoutPlanRequestCopyWithImpl<$Res, $Val extends WorkoutPlanRequest>
    implements $WorkoutPlanRequestCopyWith<$Res> {
  _$WorkoutPlanRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutPlanRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planType = null,
    Object? targetMuscleGroup = null,
    Object? workoutDurationInMinutes = null,
    Object? availableExerciseIds = null,
    Object? userWeight = freezed,
    Object? userExperienceLevel = freezed,
  }) {
    return _then(
      _value.copyWith(
            planType:
                null == planType
                    ? _value.planType
                    : planType // ignore: cast_nullable_to_non_nullable
                        as WorkoutPlanType,
            targetMuscleGroup:
                null == targetMuscleGroup
                    ? _value.targetMuscleGroup
                    : targetMuscleGroup // ignore: cast_nullable_to_non_nullable
                        as MuscleGroup,
            workoutDurationInMinutes:
                null == workoutDurationInMinutes
                    ? _value.workoutDurationInMinutes
                    : workoutDurationInMinutes // ignore: cast_nullable_to_non_nullable
                        as int,
            availableExerciseIds:
                null == availableExerciseIds
                    ? _value.availableExerciseIds
                    : availableExerciseIds // ignore: cast_nullable_to_non_nullable
                        as List<int>,
            userWeight:
                freezed == userWeight
                    ? _value.userWeight
                    : userWeight // ignore: cast_nullable_to_non_nullable
                        as double?,
            userExperienceLevel:
                freezed == userExperienceLevel
                    ? _value.userExperienceLevel
                    : userExperienceLevel // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutPlanRequestImplCopyWith<$Res>
    implements $WorkoutPlanRequestCopyWith<$Res> {
  factory _$$WorkoutPlanRequestImplCopyWith(
    _$WorkoutPlanRequestImpl value,
    $Res Function(_$WorkoutPlanRequestImpl) then,
  ) = __$$WorkoutPlanRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    WorkoutPlanType planType,
    MuscleGroup targetMuscleGroup,
    int workoutDurationInMinutes,
    List<int> availableExerciseIds,
    double? userWeight,
    int? userExperienceLevel,
  });
}

/// @nodoc
class __$$WorkoutPlanRequestImplCopyWithImpl<$Res>
    extends _$WorkoutPlanRequestCopyWithImpl<$Res, _$WorkoutPlanRequestImpl>
    implements _$$WorkoutPlanRequestImplCopyWith<$Res> {
  __$$WorkoutPlanRequestImplCopyWithImpl(
    _$WorkoutPlanRequestImpl _value,
    $Res Function(_$WorkoutPlanRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutPlanRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planType = null,
    Object? targetMuscleGroup = null,
    Object? workoutDurationInMinutes = null,
    Object? availableExerciseIds = null,
    Object? userWeight = freezed,
    Object? userExperienceLevel = freezed,
  }) {
    return _then(
      _$WorkoutPlanRequestImpl(
        planType:
            null == planType
                ? _value.planType
                : planType // ignore: cast_nullable_to_non_nullable
                    as WorkoutPlanType,
        targetMuscleGroup:
            null == targetMuscleGroup
                ? _value.targetMuscleGroup
                : targetMuscleGroup // ignore: cast_nullable_to_non_nullable
                    as MuscleGroup,
        workoutDurationInMinutes:
            null == workoutDurationInMinutes
                ? _value.workoutDurationInMinutes
                : workoutDurationInMinutes // ignore: cast_nullable_to_non_nullable
                    as int,
        availableExerciseIds:
            null == availableExerciseIds
                ? _value._availableExerciseIds
                : availableExerciseIds // ignore: cast_nullable_to_non_nullable
                    as List<int>,
        userWeight:
            freezed == userWeight
                ? _value.userWeight
                : userWeight // ignore: cast_nullable_to_non_nullable
                    as double?,
        userExperienceLevel:
            freezed == userExperienceLevel
                ? _value.userExperienceLevel
                : userExperienceLevel // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutPlanRequestImpl implements _WorkoutPlanRequest {
  const _$WorkoutPlanRequestImpl({
    required this.planType,
    required this.targetMuscleGroup,
    required this.workoutDurationInMinutes,
    required final List<int> availableExerciseIds,
    this.userWeight,
    this.userExperienceLevel,
  }) : _availableExerciseIds = availableExerciseIds;

  factory _$WorkoutPlanRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutPlanRequestImplFromJson(json);

  @override
  final WorkoutPlanType planType;
  @override
  final MuscleGroup targetMuscleGroup;
  @override
  final int workoutDurationInMinutes;
  final List<int> _availableExerciseIds;
  @override
  List<int> get availableExerciseIds {
    if (_availableExerciseIds is EqualUnmodifiableListView)
      return _availableExerciseIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableExerciseIds);
  }

  @override
  final double? userWeight;
  @override
  final int? userExperienceLevel;

  @override
  String toString() {
    return 'WorkoutPlanRequest(planType: $planType, targetMuscleGroup: $targetMuscleGroup, workoutDurationInMinutes: $workoutDurationInMinutes, availableExerciseIds: $availableExerciseIds, userWeight: $userWeight, userExperienceLevel: $userExperienceLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutPlanRequestImpl &&
            (identical(other.planType, planType) ||
                other.planType == planType) &&
            (identical(other.targetMuscleGroup, targetMuscleGroup) ||
                other.targetMuscleGroup == targetMuscleGroup) &&
            (identical(
                  other.workoutDurationInMinutes,
                  workoutDurationInMinutes,
                ) ||
                other.workoutDurationInMinutes == workoutDurationInMinutes) &&
            const DeepCollectionEquality().equals(
              other._availableExerciseIds,
              _availableExerciseIds,
            ) &&
            (identical(other.userWeight, userWeight) ||
                other.userWeight == userWeight) &&
            (identical(other.userExperienceLevel, userExperienceLevel) ||
                other.userExperienceLevel == userExperienceLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    planType,
    targetMuscleGroup,
    workoutDurationInMinutes,
    const DeepCollectionEquality().hash(_availableExerciseIds),
    userWeight,
    userExperienceLevel,
  );

  /// Create a copy of WorkoutPlanRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutPlanRequestImplCopyWith<_$WorkoutPlanRequestImpl> get copyWith =>
      __$$WorkoutPlanRequestImplCopyWithImpl<_$WorkoutPlanRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutPlanRequestImplToJson(this);
  }
}

abstract class _WorkoutPlanRequest implements WorkoutPlanRequest {
  const factory _WorkoutPlanRequest({
    required final WorkoutPlanType planType,
    required final MuscleGroup targetMuscleGroup,
    required final int workoutDurationInMinutes,
    required final List<int> availableExerciseIds,
    final double? userWeight,
    final int? userExperienceLevel,
  }) = _$WorkoutPlanRequestImpl;

  factory _WorkoutPlanRequest.fromJson(Map<String, dynamic> json) =
      _$WorkoutPlanRequestImpl.fromJson;

  @override
  WorkoutPlanType get planType;
  @override
  MuscleGroup get targetMuscleGroup;
  @override
  int get workoutDurationInMinutes;
  @override
  List<int> get availableExerciseIds;
  @override
  double? get userWeight;
  @override
  int? get userExperienceLevel;

  /// Create a copy of WorkoutPlanRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutPlanRequestImplCopyWith<_$WorkoutPlanRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
