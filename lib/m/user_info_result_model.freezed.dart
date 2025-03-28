// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserInfoResultModel _$UserInfoResultModelFromJson(Map<String, dynamic> json) {
  return _UserInfoResultModel.fromJson(json);
}

/// @nodoc
mixin _$UserInfoResultModel {
  @JsonKey(name: 'value')
  UserInfoModel? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'failureReason')
  String? get failureReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSuccess')
  bool? get isSuccess => throw _privateConstructorUsedError;

  /// Serializes this UserInfoResultModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInfoResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoResultModelCopyWith<UserInfoResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoResultModelCopyWith<$Res> {
  factory $UserInfoResultModelCopyWith(
          UserInfoResultModel value, $Res Function(UserInfoResultModel) then) =
      _$UserInfoResultModelCopyWithImpl<$Res, UserInfoResultModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'value') UserInfoModel? value,
      @JsonKey(name: 'failureReason') String? failureReason,
      @JsonKey(name: 'isSuccess') bool? isSuccess});

  $UserInfoModelCopyWith<$Res>? get value;
}

/// @nodoc
class _$UserInfoResultModelCopyWithImpl<$Res, $Val extends UserInfoResultModel>
    implements $UserInfoResultModelCopyWith<$Res> {
  _$UserInfoResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfoResultModel
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
              as UserInfoModel?,
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

  /// Create a copy of UserInfoResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoModelCopyWith<$Res>? get value {
    if (_value.value == null) {
      return null;
    }

    return $UserInfoModelCopyWith<$Res>(_value.value!, (value) {
      return _then(_value.copyWith(value: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserInfoResultModelImplCopyWith<$Res>
    implements $UserInfoResultModelCopyWith<$Res> {
  factory _$$UserInfoResultModelImplCopyWith(_$UserInfoResultModelImpl value,
          $Res Function(_$UserInfoResultModelImpl) then) =
      __$$UserInfoResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'value') UserInfoModel? value,
      @JsonKey(name: 'failureReason') String? failureReason,
      @JsonKey(name: 'isSuccess') bool? isSuccess});

  @override
  $UserInfoModelCopyWith<$Res>? get value;
}

/// @nodoc
class __$$UserInfoResultModelImplCopyWithImpl<$Res>
    extends _$UserInfoResultModelCopyWithImpl<$Res, _$UserInfoResultModelImpl>
    implements _$$UserInfoResultModelImplCopyWith<$Res> {
  __$$UserInfoResultModelImplCopyWithImpl(_$UserInfoResultModelImpl _value,
      $Res Function(_$UserInfoResultModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInfoResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? failureReason = freezed,
    Object? isSuccess = freezed,
  }) {
    return _then(_$UserInfoResultModelImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as UserInfoModel?,
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
class _$UserInfoResultModelImpl implements _UserInfoResultModel {
  const _$UserInfoResultModelImpl(
      {@JsonKey(name: 'value') this.value,
      @JsonKey(name: 'failureReason') this.failureReason,
      @JsonKey(name: 'isSuccess') this.isSuccess});

  factory _$UserInfoResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoResultModelImplFromJson(json);

  @override
  @JsonKey(name: 'value')
  final UserInfoModel? value;
  @override
  @JsonKey(name: 'failureReason')
  final String? failureReason;
  @override
  @JsonKey(name: 'isSuccess')
  final bool? isSuccess;

  @override
  String toString() {
    return 'UserInfoResultModel(value: $value, failureReason: $failureReason, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoResultModelImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, failureReason, isSuccess);

  /// Create a copy of UserInfoResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoResultModelImplCopyWith<_$UserInfoResultModelImpl> get copyWith =>
      __$$UserInfoResultModelImplCopyWithImpl<_$UserInfoResultModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoResultModelImplToJson(
      this,
    );
  }
}

abstract class _UserInfoResultModel implements UserInfoResultModel {
  const factory _UserInfoResultModel(
          {@JsonKey(name: 'value') final UserInfoModel? value,
          @JsonKey(name: 'failureReason') final String? failureReason,
          @JsonKey(name: 'isSuccess') final bool? isSuccess}) =
      _$UserInfoResultModelImpl;

  factory _UserInfoResultModel.fromJson(Map<String, dynamic> json) =
      _$UserInfoResultModelImpl.fromJson;

  @override
  @JsonKey(name: 'value')
  UserInfoModel? get value;
  @override
  @JsonKey(name: 'failureReason')
  String? get failureReason;
  @override
  @JsonKey(name: 'isSuccess')
  bool? get isSuccess;

  /// Create a copy of UserInfoResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoResultModelImplCopyWith<_$UserInfoResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) {
  return _UserInfoModel.fromJson(json);
}

/// @nodoc
mixin _$UserInfoModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String? get passwordEncrypted => throw _privateConstructorUsedError;
  @JsonKey(name: 'role')
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile')
  String? get mobile => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'tokenDurationInMin')
  int? get tokenDurationInMin => throw _privateConstructorUsedError;
  @JsonKey(name: 'isActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceLevel')
  int? get serviceLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'language')
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdDateTime')
  String? get createdDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedDateTime')
  String? get updatedDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;

  /// Serializes this UserInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoModelCopyWith<UserInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoModelCopyWith<$Res> {
  factory $UserInfoModelCopyWith(
          UserInfoModel value, $Res Function(UserInfoModel) then) =
      _$UserInfoModelCopyWithImpl<$Res, UserInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'userName') String? username,
      @JsonKey(name: 'password') String? passwordEncrypted,
      @JsonKey(name: 'role') String? role,
      @JsonKey(name: 'mobile') String? mobile,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'tokenDurationInMin') int? tokenDurationInMin,
      @JsonKey(name: 'isActive') bool? isActive,
      @JsonKey(name: 'serviceLevel') int? serviceLevel,
      @JsonKey(name: 'language') String? language,
      @JsonKey(name: 'createdDateTime') String? createdDateTime,
      @JsonKey(name: 'updatedDateTime') String? updatedDateTime,
      @JsonKey(name: 'createdBy') String? createdBy,
      @JsonKey(name: 'updatedBy') String? updatedBy});
}

/// @nodoc
class _$UserInfoModelCopyWithImpl<$Res, $Val extends UserInfoModel>
    implements $UserInfoModelCopyWith<$Res> {
  _$UserInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? passwordEncrypted = freezed,
    Object? role = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? tokenDurationInMin = freezed,
    Object? isActive = freezed,
    Object? serviceLevel = freezed,
    Object? language = freezed,
    Object? createdDateTime = freezed,
    Object? updatedDateTime = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordEncrypted: freezed == passwordEncrypted
          ? _value.passwordEncrypted
          : passwordEncrypted // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenDurationInMin: freezed == tokenDurationInMin
          ? _value.tokenDurationInMin
          : tokenDurationInMin // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      serviceLevel: freezed == serviceLevel
          ? _value.serviceLevel
          : serviceLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDateTime: freezed == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDateTime: freezed == updatedDateTime
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoModelImplCopyWith<$Res>
    implements $UserInfoModelCopyWith<$Res> {
  factory _$$UserInfoModelImplCopyWith(
          _$UserInfoModelImpl value, $Res Function(_$UserInfoModelImpl) then) =
      __$$UserInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'userName') String? username,
      @JsonKey(name: 'password') String? passwordEncrypted,
      @JsonKey(name: 'role') String? role,
      @JsonKey(name: 'mobile') String? mobile,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'tokenDurationInMin') int? tokenDurationInMin,
      @JsonKey(name: 'isActive') bool? isActive,
      @JsonKey(name: 'serviceLevel') int? serviceLevel,
      @JsonKey(name: 'language') String? language,
      @JsonKey(name: 'createdDateTime') String? createdDateTime,
      @JsonKey(name: 'updatedDateTime') String? updatedDateTime,
      @JsonKey(name: 'createdBy') String? createdBy,
      @JsonKey(name: 'updatedBy') String? updatedBy});
}

/// @nodoc
class __$$UserInfoModelImplCopyWithImpl<$Res>
    extends _$UserInfoModelCopyWithImpl<$Res, _$UserInfoModelImpl>
    implements _$$UserInfoModelImplCopyWith<$Res> {
  __$$UserInfoModelImplCopyWithImpl(
      _$UserInfoModelImpl _value, $Res Function(_$UserInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? passwordEncrypted = freezed,
    Object? role = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? tokenDurationInMin = freezed,
    Object? isActive = freezed,
    Object? serviceLevel = freezed,
    Object? language = freezed,
    Object? createdDateTime = freezed,
    Object? updatedDateTime = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_$UserInfoModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordEncrypted: freezed == passwordEncrypted
          ? _value.passwordEncrypted
          : passwordEncrypted // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenDurationInMin: freezed == tokenDurationInMin
          ? _value.tokenDurationInMin
          : tokenDurationInMin // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      serviceLevel: freezed == serviceLevel
          ? _value.serviceLevel
          : serviceLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDateTime: freezed == createdDateTime
          ? _value.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDateTime: freezed == updatedDateTime
          ? _value.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoModelImpl implements _UserInfoModel {
  const _$UserInfoModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'userName') this.username,
      @JsonKey(name: 'password') this.passwordEncrypted,
      @JsonKey(name: 'role') this.role,
      @JsonKey(name: 'mobile') this.mobile,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'tokenDurationInMin') this.tokenDurationInMin,
      @JsonKey(name: 'isActive') this.isActive,
      @JsonKey(name: 'serviceLevel') this.serviceLevel,
      @JsonKey(name: 'language') this.language,
      @JsonKey(name: 'createdDateTime') this.createdDateTime,
      @JsonKey(name: 'updatedDateTime') this.updatedDateTime,
      @JsonKey(name: 'createdBy') this.createdBy,
      @JsonKey(name: 'updatedBy') this.updatedBy});

  factory _$UserInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'userName')
  final String? username;
  @override
  @JsonKey(name: 'password')
  final String? passwordEncrypted;
  @override
  @JsonKey(name: 'role')
  final String? role;
  @override
  @JsonKey(name: 'mobile')
  final String? mobile;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'tokenDurationInMin')
  final int? tokenDurationInMin;
  @override
  @JsonKey(name: 'isActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'serviceLevel')
  final int? serviceLevel;
  @override
  @JsonKey(name: 'language')
  final String? language;
  @override
  @JsonKey(name: 'createdDateTime')
  final String? createdDateTime;
  @override
  @JsonKey(name: 'updatedDateTime')
  final String? updatedDateTime;
  @override
  @JsonKey(name: 'createdBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'updatedBy')
  final String? updatedBy;

  @override
  String toString() {
    return 'UserInfoModel(id: $id, username: $username, passwordEncrypted: $passwordEncrypted, role: $role, mobile: $mobile, email: $email, tokenDurationInMin: $tokenDurationInMin, isActive: $isActive, serviceLevel: $serviceLevel, language: $language, createdDateTime: $createdDateTime, updatedDateTime: $updatedDateTime, createdBy: $createdBy, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.passwordEncrypted, passwordEncrypted) ||
                other.passwordEncrypted == passwordEncrypted) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.tokenDurationInMin, tokenDurationInMin) ||
                other.tokenDurationInMin == tokenDurationInMin) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.serviceLevel, serviceLevel) ||
                other.serviceLevel == serviceLevel) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.createdDateTime, createdDateTime) ||
                other.createdDateTime == createdDateTime) &&
            (identical(other.updatedDateTime, updatedDateTime) ||
                other.updatedDateTime == updatedDateTime) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      passwordEncrypted,
      role,
      mobile,
      email,
      tokenDurationInMin,
      isActive,
      serviceLevel,
      language,
      createdDateTime,
      updatedDateTime,
      createdBy,
      updatedBy);

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoModelImplCopyWith<_$UserInfoModelImpl> get copyWith =>
      __$$UserInfoModelImplCopyWithImpl<_$UserInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoModelImplToJson(
      this,
    );
  }
}

abstract class _UserInfoModel implements UserInfoModel {
  const factory _UserInfoModel(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'userName') final String? username,
          @JsonKey(name: 'password') final String? passwordEncrypted,
          @JsonKey(name: 'role') final String? role,
          @JsonKey(name: 'mobile') final String? mobile,
          @JsonKey(name: 'email') final String? email,
          @JsonKey(name: 'tokenDurationInMin') final int? tokenDurationInMin,
          @JsonKey(name: 'isActive') final bool? isActive,
          @JsonKey(name: 'serviceLevel') final int? serviceLevel,
          @JsonKey(name: 'language') final String? language,
          @JsonKey(name: 'createdDateTime') final String? createdDateTime,
          @JsonKey(name: 'updatedDateTime') final String? updatedDateTime,
          @JsonKey(name: 'createdBy') final String? createdBy,
          @JsonKey(name: 'updatedBy') final String? updatedBy}) =
      _$UserInfoModelImpl;

  factory _UserInfoModel.fromJson(Map<String, dynamic> json) =
      _$UserInfoModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'userName')
  String? get username;
  @override
  @JsonKey(name: 'password')
  String? get passwordEncrypted;
  @override
  @JsonKey(name: 'role')
  String? get role;
  @override
  @JsonKey(name: 'mobile')
  String? get mobile;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'tokenDurationInMin')
  int? get tokenDurationInMin;
  @override
  @JsonKey(name: 'isActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'serviceLevel')
  int? get serviceLevel;
  @override
  @JsonKey(name: 'language')
  String? get language;
  @override
  @JsonKey(name: 'createdDateTime')
  String? get createdDateTime;
  @override
  @JsonKey(name: 'updatedDateTime')
  String? get updatedDateTime;
  @override
  @JsonKey(name: 'createdBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'updatedBy')
  String? get updatedBy;

  /// Create a copy of UserInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoModelImplCopyWith<_$UserInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
