// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_exist_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserExistResultModel _$UserExistResultModelFromJson(Map<String, dynamic> json) {
  return _UserExistResultModel.fromJson(json);
}

/// @nodoc
mixin _$UserExistResultModel {
  @JsonKey(name: 'value')
  bool? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'failureReason')
  String? get failureReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSuccess')
  bool? get isSuccess => throw _privateConstructorUsedError;

  /// Serializes this UserExistResultModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserExistResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserExistResultModelCopyWith<UserExistResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserExistResultModelCopyWith<$Res> {
  factory $UserExistResultModelCopyWith(UserExistResultModel value,
          $Res Function(UserExistResultModel) then) =
      _$UserExistResultModelCopyWithImpl<$Res, UserExistResultModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'value') bool? value,
      @JsonKey(name: 'failureReason') String? failureReason,
      @JsonKey(name: 'isSuccess') bool? isSuccess});
}

/// @nodoc
class _$UserExistResultModelCopyWithImpl<$Res,
        $Val extends UserExistResultModel>
    implements $UserExistResultModelCopyWith<$Res> {
  _$UserExistResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserExistResultModel
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
              as bool?,
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
}

/// @nodoc
abstract class _$$UserExistResultModelImplCopyWith<$Res>
    implements $UserExistResultModelCopyWith<$Res> {
  factory _$$UserExistResultModelImplCopyWith(_$UserExistResultModelImpl value,
          $Res Function(_$UserExistResultModelImpl) then) =
      __$$UserExistResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'value') bool? value,
      @JsonKey(name: 'failureReason') String? failureReason,
      @JsonKey(name: 'isSuccess') bool? isSuccess});
}

/// @nodoc
class __$$UserExistResultModelImplCopyWithImpl<$Res>
    extends _$UserExistResultModelCopyWithImpl<$Res, _$UserExistResultModelImpl>
    implements _$$UserExistResultModelImplCopyWith<$Res> {
  __$$UserExistResultModelImplCopyWithImpl(_$UserExistResultModelImpl _value,
      $Res Function(_$UserExistResultModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserExistResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? failureReason = freezed,
    Object? isSuccess = freezed,
  }) {
    return _then(_$UserExistResultModelImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool?,
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
class _$UserExistResultModelImpl implements _UserExistResultModel {
  const _$UserExistResultModelImpl(
      {@JsonKey(name: 'value') this.value,
      @JsonKey(name: 'failureReason') this.failureReason,
      @JsonKey(name: 'isSuccess') this.isSuccess});

  factory _$UserExistResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserExistResultModelImplFromJson(json);

  @override
  @JsonKey(name: 'value')
  final bool? value;
  @override
  @JsonKey(name: 'failureReason')
  final String? failureReason;
  @override
  @JsonKey(name: 'isSuccess')
  final bool? isSuccess;

  @override
  String toString() {
    return 'UserExistResultModel(value: $value, failureReason: $failureReason, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserExistResultModelImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, failureReason, isSuccess);

  /// Create a copy of UserExistResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserExistResultModelImplCopyWith<_$UserExistResultModelImpl>
      get copyWith =>
          __$$UserExistResultModelImplCopyWithImpl<_$UserExistResultModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserExistResultModelImplToJson(
      this,
    );
  }
}

abstract class _UserExistResultModel implements UserExistResultModel {
  const factory _UserExistResultModel(
          {@JsonKey(name: 'value') final bool? value,
          @JsonKey(name: 'failureReason') final String? failureReason,
          @JsonKey(name: 'isSuccess') final bool? isSuccess}) =
      _$UserExistResultModelImpl;

  factory _UserExistResultModel.fromJson(Map<String, dynamic> json) =
      _$UserExistResultModelImpl.fromJson;

  @override
  @JsonKey(name: 'value')
  bool? get value;
  @override
  @JsonKey(name: 'failureReason')
  String? get failureReason;
  @override
  @JsonKey(name: 'isSuccess')
  bool? get isSuccess;

  /// Create a copy of UserExistResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserExistResultModelImplCopyWith<_$UserExistResultModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
