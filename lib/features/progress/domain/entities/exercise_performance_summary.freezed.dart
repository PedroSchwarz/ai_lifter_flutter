// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_performance_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ExercisePerformanceSummary _$ExercisePerformanceSummaryFromJson(
  Map<String, dynamic> json,
) {
  return _ExercisePerformanceSummary.fromJson(json);
}

/// @nodoc
mixin _$ExercisePerformanceSummary {
  int get exerciseId => throw _privateConstructorUsedError;
  String get exerciseName => throw _privateConstructorUsedError;
  int get totalSets => throw _privateConstructorUsedError;
  int get completedSets => throw _privateConstructorUsedError;
  double get completionRate => throw _privateConstructorUsedError;
  int get underperformedCount => throw _privateConstructorUsedError;
  int get performedCount => throw _privateConstructorUsedError;
  int get overperformedCount => throw _privateConstructorUsedError;
  double get underperformedPercentage => throw _privateConstructorUsedError;
  double get performedPercentage => throw _privateConstructorUsedError;
  double get overperformedPercentage => throw _privateConstructorUsedError;

  /// Serializes this ExercisePerformanceSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExercisePerformanceSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExercisePerformanceSummaryCopyWith<ExercisePerformanceSummary>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExercisePerformanceSummaryCopyWith<$Res> {
  factory $ExercisePerformanceSummaryCopyWith(
    ExercisePerformanceSummary value,
    $Res Function(ExercisePerformanceSummary) then,
  ) =
      _$ExercisePerformanceSummaryCopyWithImpl<
        $Res,
        ExercisePerformanceSummary
      >;
  @useResult
  $Res call({
    int exerciseId,
    String exerciseName,
    int totalSets,
    int completedSets,
    double completionRate,
    int underperformedCount,
    int performedCount,
    int overperformedCount,
    double underperformedPercentage,
    double performedPercentage,
    double overperformedPercentage,
  });
}

/// @nodoc
class _$ExercisePerformanceSummaryCopyWithImpl<
  $Res,
  $Val extends ExercisePerformanceSummary
>
    implements $ExercisePerformanceSummaryCopyWith<$Res> {
  _$ExercisePerformanceSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExercisePerformanceSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? exerciseName = null,
    Object? totalSets = null,
    Object? completedSets = null,
    Object? completionRate = null,
    Object? underperformedCount = null,
    Object? performedCount = null,
    Object? overperformedCount = null,
    Object? underperformedPercentage = null,
    Object? performedPercentage = null,
    Object? overperformedPercentage = null,
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
            totalSets:
                null == totalSets
                    ? _value.totalSets
                    : totalSets // ignore: cast_nullable_to_non_nullable
                        as int,
            completedSets:
                null == completedSets
                    ? _value.completedSets
                    : completedSets // ignore: cast_nullable_to_non_nullable
                        as int,
            completionRate:
                null == completionRate
                    ? _value.completionRate
                    : completionRate // ignore: cast_nullable_to_non_nullable
                        as double,
            underperformedCount:
                null == underperformedCount
                    ? _value.underperformedCount
                    : underperformedCount // ignore: cast_nullable_to_non_nullable
                        as int,
            performedCount:
                null == performedCount
                    ? _value.performedCount
                    : performedCount // ignore: cast_nullable_to_non_nullable
                        as int,
            overperformedCount:
                null == overperformedCount
                    ? _value.overperformedCount
                    : overperformedCount // ignore: cast_nullable_to_non_nullable
                        as int,
            underperformedPercentage:
                null == underperformedPercentage
                    ? _value.underperformedPercentage
                    : underperformedPercentage // ignore: cast_nullable_to_non_nullable
                        as double,
            performedPercentage:
                null == performedPercentage
                    ? _value.performedPercentage
                    : performedPercentage // ignore: cast_nullable_to_non_nullable
                        as double,
            overperformedPercentage:
                null == overperformedPercentage
                    ? _value.overperformedPercentage
                    : overperformedPercentage // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExercisePerformanceSummaryImplCopyWith<$Res>
    implements $ExercisePerformanceSummaryCopyWith<$Res> {
  factory _$$ExercisePerformanceSummaryImplCopyWith(
    _$ExercisePerformanceSummaryImpl value,
    $Res Function(_$ExercisePerformanceSummaryImpl) then,
  ) = __$$ExercisePerformanceSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int exerciseId,
    String exerciseName,
    int totalSets,
    int completedSets,
    double completionRate,
    int underperformedCount,
    int performedCount,
    int overperformedCount,
    double underperformedPercentage,
    double performedPercentage,
    double overperformedPercentage,
  });
}

/// @nodoc
class __$$ExercisePerformanceSummaryImplCopyWithImpl<$Res>
    extends
        _$ExercisePerformanceSummaryCopyWithImpl<
          $Res,
          _$ExercisePerformanceSummaryImpl
        >
    implements _$$ExercisePerformanceSummaryImplCopyWith<$Res> {
  __$$ExercisePerformanceSummaryImplCopyWithImpl(
    _$ExercisePerformanceSummaryImpl _value,
    $Res Function(_$ExercisePerformanceSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExercisePerformanceSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? exerciseName = null,
    Object? totalSets = null,
    Object? completedSets = null,
    Object? completionRate = null,
    Object? underperformedCount = null,
    Object? performedCount = null,
    Object? overperformedCount = null,
    Object? underperformedPercentage = null,
    Object? performedPercentage = null,
    Object? overperformedPercentage = null,
  }) {
    return _then(
      _$ExercisePerformanceSummaryImpl(
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
        totalSets:
            null == totalSets
                ? _value.totalSets
                : totalSets // ignore: cast_nullable_to_non_nullable
                    as int,
        completedSets:
            null == completedSets
                ? _value.completedSets
                : completedSets // ignore: cast_nullable_to_non_nullable
                    as int,
        completionRate:
            null == completionRate
                ? _value.completionRate
                : completionRate // ignore: cast_nullable_to_non_nullable
                    as double,
        underperformedCount:
            null == underperformedCount
                ? _value.underperformedCount
                : underperformedCount // ignore: cast_nullable_to_non_nullable
                    as int,
        performedCount:
            null == performedCount
                ? _value.performedCount
                : performedCount // ignore: cast_nullable_to_non_nullable
                    as int,
        overperformedCount:
            null == overperformedCount
                ? _value.overperformedCount
                : overperformedCount // ignore: cast_nullable_to_non_nullable
                    as int,
        underperformedPercentage:
            null == underperformedPercentage
                ? _value.underperformedPercentage
                : underperformedPercentage // ignore: cast_nullable_to_non_nullable
                    as double,
        performedPercentage:
            null == performedPercentage
                ? _value.performedPercentage
                : performedPercentage // ignore: cast_nullable_to_non_nullable
                    as double,
        overperformedPercentage:
            null == overperformedPercentage
                ? _value.overperformedPercentage
                : overperformedPercentage // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExercisePerformanceSummaryImpl implements _ExercisePerformanceSummary {
  const _$ExercisePerformanceSummaryImpl({
    required this.exerciseId,
    required this.exerciseName,
    required this.totalSets,
    required this.completedSets,
    required this.completionRate,
    required this.underperformedCount,
    required this.performedCount,
    required this.overperformedCount,
    required this.underperformedPercentage,
    required this.performedPercentage,
    required this.overperformedPercentage,
  });

  factory _$ExercisePerformanceSummaryImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ExercisePerformanceSummaryImplFromJson(json);

  @override
  final int exerciseId;
  @override
  final String exerciseName;
  @override
  final int totalSets;
  @override
  final int completedSets;
  @override
  final double completionRate;
  @override
  final int underperformedCount;
  @override
  final int performedCount;
  @override
  final int overperformedCount;
  @override
  final double underperformedPercentage;
  @override
  final double performedPercentage;
  @override
  final double overperformedPercentage;

  @override
  String toString() {
    return 'ExercisePerformanceSummary(exerciseId: $exerciseId, exerciseName: $exerciseName, totalSets: $totalSets, completedSets: $completedSets, completionRate: $completionRate, underperformedCount: $underperformedCount, performedCount: $performedCount, overperformedCount: $overperformedCount, underperformedPercentage: $underperformedPercentage, performedPercentage: $performedPercentage, overperformedPercentage: $overperformedPercentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExercisePerformanceSummaryImpl &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            (identical(other.totalSets, totalSets) ||
                other.totalSets == totalSets) &&
            (identical(other.completedSets, completedSets) ||
                other.completedSets == completedSets) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.underperformedCount, underperformedCount) ||
                other.underperformedCount == underperformedCount) &&
            (identical(other.performedCount, performedCount) ||
                other.performedCount == performedCount) &&
            (identical(other.overperformedCount, overperformedCount) ||
                other.overperformedCount == overperformedCount) &&
            (identical(
                  other.underperformedPercentage,
                  underperformedPercentage,
                ) ||
                other.underperformedPercentage == underperformedPercentage) &&
            (identical(other.performedPercentage, performedPercentage) ||
                other.performedPercentage == performedPercentage) &&
            (identical(
                  other.overperformedPercentage,
                  overperformedPercentage,
                ) ||
                other.overperformedPercentage == overperformedPercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    exerciseId,
    exerciseName,
    totalSets,
    completedSets,
    completionRate,
    underperformedCount,
    performedCount,
    overperformedCount,
    underperformedPercentage,
    performedPercentage,
    overperformedPercentage,
  );

  /// Create a copy of ExercisePerformanceSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExercisePerformanceSummaryImplCopyWith<_$ExercisePerformanceSummaryImpl>
  get copyWith => __$$ExercisePerformanceSummaryImplCopyWithImpl<
    _$ExercisePerformanceSummaryImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExercisePerformanceSummaryImplToJson(this);
  }
}

abstract class _ExercisePerformanceSummary
    implements ExercisePerformanceSummary {
  const factory _ExercisePerformanceSummary({
    required final int exerciseId,
    required final String exerciseName,
    required final int totalSets,
    required final int completedSets,
    required final double completionRate,
    required final int underperformedCount,
    required final int performedCount,
    required final int overperformedCount,
    required final double underperformedPercentage,
    required final double performedPercentage,
    required final double overperformedPercentage,
  }) = _$ExercisePerformanceSummaryImpl;

  factory _ExercisePerformanceSummary.fromJson(Map<String, dynamic> json) =
      _$ExercisePerformanceSummaryImpl.fromJson;

  @override
  int get exerciseId;
  @override
  String get exerciseName;
  @override
  int get totalSets;
  @override
  int get completedSets;
  @override
  double get completionRate;
  @override
  int get underperformedCount;
  @override
  int get performedCount;
  @override
  int get overperformedCount;
  @override
  double get underperformedPercentage;
  @override
  double get performedPercentage;
  @override
  double get overperformedPercentage;

  /// Create a copy of ExercisePerformanceSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExercisePerformanceSummaryImplCopyWith<_$ExercisePerformanceSummaryImpl>
  get copyWith => throw _privateConstructorUsedError;
}
