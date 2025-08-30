// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progression_recommendation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProgressionRecommendation _$ProgressionRecommendationFromJson(
  Map<String, dynamic> json,
) {
  return _ProgressionRecommendation.fromJson(json);
}

/// @nodoc
mixin _$ProgressionRecommendation {
  ProgressionType get type => throw _privateConstructorUsedError;
  double? get suggestedWeight => throw _privateConstructorUsedError;
  int? get suggestedReps => throw _privateConstructorUsedError;
  String get reasoning => throw _privateConstructorUsedError;

  /// Serializes this ProgressionRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProgressionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgressionRecommendationCopyWith<ProgressionRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressionRecommendationCopyWith<$Res> {
  factory $ProgressionRecommendationCopyWith(
    ProgressionRecommendation value,
    $Res Function(ProgressionRecommendation) then,
  ) = _$ProgressionRecommendationCopyWithImpl<$Res, ProgressionRecommendation>;
  @useResult
  $Res call({
    ProgressionType type,
    double? suggestedWeight,
    int? suggestedReps,
    String reasoning,
  });
}

/// @nodoc
class _$ProgressionRecommendationCopyWithImpl<
  $Res,
  $Val extends ProgressionRecommendation
>
    implements $ProgressionRecommendationCopyWith<$Res> {
  _$ProgressionRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgressionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? suggestedWeight = freezed,
    Object? suggestedReps = freezed,
    Object? reasoning = null,
  }) {
    return _then(
      _value.copyWith(
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as ProgressionType,
            suggestedWeight:
                freezed == suggestedWeight
                    ? _value.suggestedWeight
                    : suggestedWeight // ignore: cast_nullable_to_non_nullable
                        as double?,
            suggestedReps:
                freezed == suggestedReps
                    ? _value.suggestedReps
                    : suggestedReps // ignore: cast_nullable_to_non_nullable
                        as int?,
            reasoning:
                null == reasoning
                    ? _value.reasoning
                    : reasoning // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProgressionRecommendationImplCopyWith<$Res>
    implements $ProgressionRecommendationCopyWith<$Res> {
  factory _$$ProgressionRecommendationImplCopyWith(
    _$ProgressionRecommendationImpl value,
    $Res Function(_$ProgressionRecommendationImpl) then,
  ) = __$$ProgressionRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ProgressionType type,
    double? suggestedWeight,
    int? suggestedReps,
    String reasoning,
  });
}

/// @nodoc
class __$$ProgressionRecommendationImplCopyWithImpl<$Res>
    extends
        _$ProgressionRecommendationCopyWithImpl<
          $Res,
          _$ProgressionRecommendationImpl
        >
    implements _$$ProgressionRecommendationImplCopyWith<$Res> {
  __$$ProgressionRecommendationImplCopyWithImpl(
    _$ProgressionRecommendationImpl _value,
    $Res Function(_$ProgressionRecommendationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProgressionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? suggestedWeight = freezed,
    Object? suggestedReps = freezed,
    Object? reasoning = null,
  }) {
    return _then(
      _$ProgressionRecommendationImpl(
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as ProgressionType,
        suggestedWeight:
            freezed == suggestedWeight
                ? _value.suggestedWeight
                : suggestedWeight // ignore: cast_nullable_to_non_nullable
                    as double?,
        suggestedReps:
            freezed == suggestedReps
                ? _value.suggestedReps
                : suggestedReps // ignore: cast_nullable_to_non_nullable
                    as int?,
        reasoning:
            null == reasoning
                ? _value.reasoning
                : reasoning // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgressionRecommendationImpl implements _ProgressionRecommendation {
  const _$ProgressionRecommendationImpl({
    required this.type,
    this.suggestedWeight,
    this.suggestedReps,
    required this.reasoning,
  });

  factory _$ProgressionRecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgressionRecommendationImplFromJson(json);

  @override
  final ProgressionType type;
  @override
  final double? suggestedWeight;
  @override
  final int? suggestedReps;
  @override
  final String reasoning;

  @override
  String toString() {
    return 'ProgressionRecommendation(type: $type, suggestedWeight: $suggestedWeight, suggestedReps: $suggestedReps, reasoning: $reasoning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressionRecommendationImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.suggestedWeight, suggestedWeight) ||
                other.suggestedWeight == suggestedWeight) &&
            (identical(other.suggestedReps, suggestedReps) ||
                other.suggestedReps == suggestedReps) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, suggestedWeight, suggestedReps, reasoning);

  /// Create a copy of ProgressionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressionRecommendationImplCopyWith<_$ProgressionRecommendationImpl>
  get copyWith => __$$ProgressionRecommendationImplCopyWithImpl<
    _$ProgressionRecommendationImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgressionRecommendationImplToJson(this);
  }
}

abstract class _ProgressionRecommendation implements ProgressionRecommendation {
  const factory _ProgressionRecommendation({
    required final ProgressionType type,
    final double? suggestedWeight,
    final int? suggestedReps,
    required final String reasoning,
  }) = _$ProgressionRecommendationImpl;

  factory _ProgressionRecommendation.fromJson(Map<String, dynamic> json) =
      _$ProgressionRecommendationImpl.fromJson;

  @override
  ProgressionType get type;
  @override
  double? get suggestedWeight;
  @override
  int? get suggestedReps;
  @override
  String get reasoning;

  /// Create a copy of ProgressionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgressionRecommendationImplCopyWith<_$ProgressionRecommendationImpl>
  get copyWith => throw _privateConstructorUsedError;
}
