// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthResultModel _$AuthResultModelFromJson(Map<String, dynamic> json) {
  return _AuthResultModel.fromJson(json);
}

/// @nodoc
mixin _$AuthResultModel {
  @JsonKey(name: 'value')
  AuthModel? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'failureReason')
  String? get failureReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSuccess')
  bool? get isSuccess => throw _privateConstructorUsedError;

  /// Serializes this AuthResultModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResultModelCopyWith<AuthResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResultModelCopyWith<$Res> {
  factory $AuthResultModelCopyWith(
          AuthResultModel value, $Res Function(AuthResultModel) then) =
      _$AuthResultModelCopyWithImpl<$Res, AuthResultModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'value') AuthModel? value,
      @JsonKey(name: 'failureReason') String? failureReason,
      @JsonKey(name: 'isSuccess') bool? isSuccess});

  $AuthModelCopyWith<$Res>? get value;
}

/// @nodoc
class _$AuthResultModelCopyWithImpl<$Res, $Val extends AuthResultModel>
    implements $AuthResultModelCopyWith<$Res> {
  _$AuthResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? failureReason = freezed,
    Object? isSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as AuthModel?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of AuthResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthModelCopyWith<$Res>? get value {
    if (_value.value == null) {
      return null;
    }

    return $AuthModelCopyWith<$Res>(_value.value!, (value) {
      return _then(_value.copyWith(value: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthResultModelImplCopyWith<$Res>
    implements $AuthResultModelCopyWith<$Res> {
  factory _$$AuthResultModelImplCopyWith(_$AuthResultModelImpl value,
          $Res Function(_$AuthResultModelImpl) then) =
      __$$AuthResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'value') AuthModel? value,
      @JsonKey(name: 'failureReason') String? failureReason,
      @JsonKey(name: 'isSuccess') bool? isSuccess});

  @override
  $AuthModelCopyWith<$Res>? get value;
}

/// @nodoc
class __$$AuthResultModelImplCopyWithImpl<$Res>
    extends _$AuthResultModelCopyWithImpl<$Res, _$AuthResultModelImpl>
    implements _$$AuthResultModelImplCopyWith<$Res> {
  __$$AuthResultModelImplCopyWithImpl(
      _$AuthResultModelImpl _value, $Res Function(_$AuthResultModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? failureReason = freezed,
    Object? isSuccess = freezed,
  }) {
    return _then(_$AuthResultModelImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as AuthModel?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResultModelImpl implements _AuthResultModel {
  const _$AuthResultModelImpl(
      {@JsonKey(name: 'value') this.value,
      @JsonKey(name: 'failureReason') this.failureReason,
      @JsonKey(name: 'isSuccess') this.isSuccess});

  factory _$AuthResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResultModelImplFromJson(json);

  @override
  @JsonKey(name: 'value')
  final AuthModel? value;
  @override
  @JsonKey(name: 'failureReason')
  final String? failureReason;
  @override
  @JsonKey(name: 'isSuccess')
  final bool? isSuccess;

  @override
  String toString() {
    return 'AuthResultModel(value: $value, failureReason: $failureReason, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResultModelImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, failureReason, isSuccess);

  /// Create a copy of AuthResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResultModelImplCopyWith<_$AuthResultModelImpl> get copyWith =>
      __$$AuthResultModelImplCopyWithImpl<_$AuthResultModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResultModelImplToJson(
      this,
    );
  }
}

abstract class _AuthResultModel implements AuthResultModel {
  const factory _AuthResultModel(
          {@JsonKey(name: 'value') final AuthModel? value,
          @JsonKey(name: 'failureReason') final String? failureReason,
          @JsonKey(name: 'isSuccess') final bool? isSuccess}) =
      _$AuthResultModelImpl;

  factory _AuthResultModel.fromJson(Map<String, dynamic> json) =
      _$AuthResultModelImpl.fromJson;

  @override
  @JsonKey(name: 'value')
  AuthModel? get value;
  @override
  @JsonKey(name: 'failureReason')
  String? get failureReason;
  @override
  @JsonKey(name: 'isSuccess')
  bool? get isSuccess;

  /// Create a copy of AuthResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResultModelImplCopyWith<_$AuthResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) {
  return _AuthModel.fromJson(json);
}

/// @nodoc
mixin _$AuthModel {
  @JsonKey(name: 'token')
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'validInMins')
  int? get validInMins => throw _privateConstructorUsedError;
  @JsonKey(name: 'validUntilUTC')
  String? get validUntilUTC => throw _privateConstructorUsedError;

  /// Serializes this AuthModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthModelCopyWith<AuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthModelCopyWith<$Res> {
  factory $AuthModelCopyWith(AuthModel value, $Res Function(AuthModel) then) =
      _$AuthModelCopyWithImpl<$Res, AuthModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'token') String? token,
      @JsonKey(name: 'validInMins') int? validInMins,
      @JsonKey(name: 'validUntilUTC') String? validUntilUTC});
}

/// @nodoc
class _$AuthModelCopyWithImpl<$Res, $Val extends AuthModel>
    implements $AuthModelCopyWith<$Res> {
  _$AuthModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? validInMins = freezed,
    Object? validUntilUTC = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      validInMins: freezed == validInMins
          ? _value.validInMins
          : validInMins // ignore: cast_nullable_to_non_nullable
              as int?,
      validUntilUTC: freezed == validUntilUTC
          ? _value.validUntilUTC
          : validUntilUTC // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthModelImplCopyWith<$Res>
    implements $AuthModelCopyWith<$Res> {
  factory _$$AuthModelImplCopyWith(
          _$AuthModelImpl value, $Res Function(_$AuthModelImpl) then) =
      __$$AuthModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'token') String? token,
      @JsonKey(name: 'validInMins') int? validInMins,
      @JsonKey(name: 'validUntilUTC') String? validUntilUTC});
}

/// @nodoc
class __$$AuthModelImplCopyWithImpl<$Res>
    extends _$AuthModelCopyWithImpl<$Res, _$AuthModelImpl>
    implements _$$AuthModelImplCopyWith<$Res> {
  __$$AuthModelImplCopyWithImpl(
      _$AuthModelImpl _value, $Res Function(_$AuthModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? validInMins = freezed,
    Object? validUntilUTC = freezed,
  }) {
    return _then(_$AuthModelImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      validInMins: freezed == validInMins
          ? _value.validInMins
          : validInMins // ignore: cast_nullable_to_non_nullable
              as int?,
      validUntilUTC: freezed == validUntilUTC
          ? _value.validUntilUTC
          : validUntilUTC // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthModelImpl implements _AuthModel {
  const _$AuthModelImpl(
      {@JsonKey(name: 'token') this.token,
      @JsonKey(name: 'validInMins') this.validInMins,
      @JsonKey(name: 'validUntilUTC') this.validUntilUTC});

  factory _$AuthModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthModelImplFromJson(json);

  @override
  @JsonKey(name: 'token')
  final String? token;
  @override
  @JsonKey(name: 'validInMins')
  final int? validInMins;
  @override
  @JsonKey(name: 'validUntilUTC')
  final String? validUntilUTC;

  @override
  String toString() {
    return 'AuthModel(token: $token, validInMins: $validInMins, validUntilUTC: $validUntilUTC)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.validInMins, validInMins) ||
                other.validInMins == validInMins) &&
            (identical(other.validUntilUTC, validUntilUTC) ||
                other.validUntilUTC == validUntilUTC));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, token, validInMins, validUntilUTC);

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthModelImplCopyWith<_$AuthModelImpl> get copyWith =>
      __$$AuthModelImplCopyWithImpl<_$AuthModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthModelImplToJson(
      this,
    );
  }
}

abstract class _AuthModel implements AuthModel {
  const factory _AuthModel(
          {@JsonKey(name: 'token') final String? token,
          @JsonKey(name: 'validInMins') final int? validInMins,
          @JsonKey(name: 'validUntilUTC') final String? validUntilUTC}) =
      _$AuthModelImpl;

  factory _AuthModel.fromJson(Map<String, dynamic> json) =
      _$AuthModelImpl.fromJson;

  @override
  @JsonKey(name: 'token')
  String? get token;
  @override
  @JsonKey(name: 'validInMins')
  int? get validInMins;
  @override
  @JsonKey(name: 'validUntilUTC')
  String? get validUntilUTC;

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthModelImplCopyWith<_$AuthModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
