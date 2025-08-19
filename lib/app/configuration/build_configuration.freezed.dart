// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'build_configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BuildConfiguration {
  Environment get environment => throw _privateConstructorUsedError;

  /// Create a copy of BuildConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BuildConfigurationCopyWith<BuildConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildConfigurationCopyWith<$Res> {
  factory $BuildConfigurationCopyWith(
    BuildConfiguration value,
    $Res Function(BuildConfiguration) then,
  ) = _$BuildConfigurationCopyWithImpl<$Res, BuildConfiguration>;
  @useResult
  $Res call({Environment environment});
}

/// @nodoc
class _$BuildConfigurationCopyWithImpl<$Res, $Val extends BuildConfiguration>
    implements $BuildConfigurationCopyWith<$Res> {
  _$BuildConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BuildConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? environment = null}) {
    return _then(
      _value.copyWith(
            environment:
                null == environment
                    ? _value.environment
                    : environment // ignore: cast_nullable_to_non_nullable
                        as Environment,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BuildConfigurationImplCopyWith<$Res>
    implements $BuildConfigurationCopyWith<$Res> {
  factory _$$BuildConfigurationImplCopyWith(
    _$BuildConfigurationImpl value,
    $Res Function(_$BuildConfigurationImpl) then,
  ) = __$$BuildConfigurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Environment environment});
}

/// @nodoc
class __$$BuildConfigurationImplCopyWithImpl<$Res>
    extends _$BuildConfigurationCopyWithImpl<$Res, _$BuildConfigurationImpl>
    implements _$$BuildConfigurationImplCopyWith<$Res> {
  __$$BuildConfigurationImplCopyWithImpl(
    _$BuildConfigurationImpl _value,
    $Res Function(_$BuildConfigurationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BuildConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? environment = null}) {
    return _then(
      _$BuildConfigurationImpl(
        environment:
            null == environment
                ? _value.environment
                : environment // ignore: cast_nullable_to_non_nullable
                    as Environment,
      ),
    );
  }
}

/// @nodoc

class _$BuildConfigurationImpl implements _BuildConfiguration {
  const _$BuildConfigurationImpl({required this.environment});

  @override
  final Environment environment;

  @override
  String toString() {
    return 'BuildConfiguration(environment: $environment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuildConfigurationImpl &&
            (identical(other.environment, environment) ||
                other.environment == environment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, environment);

  /// Create a copy of BuildConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BuildConfigurationImplCopyWith<_$BuildConfigurationImpl> get copyWith =>
      __$$BuildConfigurationImplCopyWithImpl<_$BuildConfigurationImpl>(
        this,
        _$identity,
      );
}

abstract class _BuildConfiguration implements BuildConfiguration {
  const factory _BuildConfiguration({required final Environment environment}) =
      _$BuildConfigurationImpl;

  @override
  Environment get environment;

  /// Create a copy of BuildConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BuildConfigurationImplCopyWith<_$BuildConfigurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
