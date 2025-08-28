// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progression_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProgressionData _$ProgressionDataFromJson(Map<String, dynamic> json) {
  return _ProgressionData.fromJson(json);
}

/// @nodoc
mixin _$ProgressionData {
  Map<int, ProgressionRecommendation> get recommendations =>
      throw _privateConstructorUsedError;
  Map<int, ExercisePerformanceSummary> get performanceSummaries =>
      throw _privateConstructorUsedError;

  /// Serializes this ProgressionData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProgressionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgressionDataCopyWith<ProgressionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressionDataCopyWith<$Res> {
  factory $ProgressionDataCopyWith(
    ProgressionData value,
    $Res Function(ProgressionData) then,
  ) = _$ProgressionDataCopyWithImpl<$Res, ProgressionData>;
  @useResult
  $Res call({
    Map<int, ProgressionRecommendation> recommendations,
    Map<int, ExercisePerformanceSummary> performanceSummaries,
  });
}

/// @nodoc
class _$ProgressionDataCopyWithImpl<$Res, $Val extends ProgressionData>
    implements $ProgressionDataCopyWith<$Res> {
  _$ProgressionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgressionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendations = null,
    Object? performanceSummaries = null,
  }) {
    return _then(
      _value.copyWith(
            recommendations:
                null == recommendations
                    ? _value.recommendations
                    : recommendations // ignore: cast_nullable_to_non_nullable
                        as Map<int, ProgressionRecommendation>,
            performanceSummaries:
                null == performanceSummaries
                    ? _value.performanceSummaries
                    : performanceSummaries // ignore: cast_nullable_to_non_nullable
                        as Map<int, ExercisePerformanceSummary>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProgressionDataImplCopyWith<$Res>
    implements $ProgressionDataCopyWith<$Res> {
  factory _$$ProgressionDataImplCopyWith(
    _$ProgressionDataImpl value,
    $Res Function(_$ProgressionDataImpl) then,
  ) = __$$ProgressionDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Map<int, ProgressionRecommendation> recommendations,
    Map<int, ExercisePerformanceSummary> performanceSummaries,
  });
}

/// @nodoc
class __$$ProgressionDataImplCopyWithImpl<$Res>
    extends _$ProgressionDataCopyWithImpl<$Res, _$ProgressionDataImpl>
    implements _$$ProgressionDataImplCopyWith<$Res> {
  __$$ProgressionDataImplCopyWithImpl(
    _$ProgressionDataImpl _value,
    $Res Function(_$ProgressionDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProgressionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendations = null,
    Object? performanceSummaries = null,
  }) {
    return _then(
      _$ProgressionDataImpl(
        recommendations:
            null == recommendations
                ? _value._recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                    as Map<int, ProgressionRecommendation>,
        performanceSummaries:
            null == performanceSummaries
                ? _value._performanceSummaries
                : performanceSummaries // ignore: cast_nullable_to_non_nullable
                    as Map<int, ExercisePerformanceSummary>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgressionDataImpl implements _ProgressionData {
  const _$ProgressionDataImpl({
    required final Map<int, ProgressionRecommendation> recommendations,
    required final Map<int, ExercisePerformanceSummary> performanceSummaries,
  }) : _recommendations = recommendations,
       _performanceSummaries = performanceSummaries;

  factory _$ProgressionDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgressionDataImplFromJson(json);

  final Map<int, ProgressionRecommendation> _recommendations;
  @override
  Map<int, ProgressionRecommendation> get recommendations {
    if (_recommendations is EqualUnmodifiableMapView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_recommendations);
  }

  final Map<int, ExercisePerformanceSummary> _performanceSummaries;
  @override
  Map<int, ExercisePerformanceSummary> get performanceSummaries {
    if (_performanceSummaries is EqualUnmodifiableMapView)
      return _performanceSummaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_performanceSummaries);
  }

  @override
  String toString() {
    return 'ProgressionData(recommendations: $recommendations, performanceSummaries: $performanceSummaries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressionDataImpl &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ) &&
            const DeepCollectionEquality().equals(
              other._performanceSummaries,
              _performanceSummaries,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_recommendations),
    const DeepCollectionEquality().hash(_performanceSummaries),
  );

  /// Create a copy of ProgressionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressionDataImplCopyWith<_$ProgressionDataImpl> get copyWith =>
      __$$ProgressionDataImplCopyWithImpl<_$ProgressionDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgressionDataImplToJson(this);
  }
}

abstract class _ProgressionData implements ProgressionData {
  const factory _ProgressionData({
    required final Map<int, ProgressionRecommendation> recommendations,
    required final Map<int, ExercisePerformanceSummary> performanceSummaries,
  }) = _$ProgressionDataImpl;

  factory _ProgressionData.fromJson(Map<String, dynamic> json) =
      _$ProgressionDataImpl.fromJson;

  @override
  Map<int, ProgressionRecommendation> get recommendations;
  @override
  Map<int, ExercisePerformanceSummary> get performanceSummaries;

  /// Create a copy of ProgressionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgressionDataImplCopyWith<_$ProgressionDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
