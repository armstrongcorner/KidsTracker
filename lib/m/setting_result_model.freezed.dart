// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SettingResultModel _$SettingResultModelFromJson(Map<String, dynamic> json) {
  return _SettingResultModel.fromJson(json);
}

/// @nodoc
mixin _$SettingResultModel {
  @JsonKey(name: 'value')
  List<SettingModel>? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'failureReason')
  String? get failureReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSuccess')
  bool? get isSuccess => throw _privateConstructorUsedError;

  /// Serializes this SettingResultModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SettingResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingResultModelCopyWith<SettingResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingResultModelCopyWith<$Res> {
  factory $SettingResultModelCopyWith(
          SettingResultModel value, $Res Function(SettingResultModel) then) =
      _$SettingResultModelCopyWithImpl<$Res, SettingResultModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'value') List<SettingModel>? value,
      @JsonKey(name: 'failureReason') String? failureReason,
      @JsonKey(name: 'isSuccess') bool? isSuccess});
}

/// @nodoc
class _$SettingResultModelCopyWithImpl<$Res, $Val extends SettingResultModel>
    implements $SettingResultModelCopyWith<$Res> {
  _$SettingResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingResultModel
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
              as List<SettingModel>?,
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
abstract class _$$SettingResultModelImplCopyWith<$Res>
    implements $SettingResultModelCopyWith<$Res> {
  factory _$$SettingResultModelImplCopyWith(_$SettingResultModelImpl value,
          $Res Function(_$SettingResultModelImpl) then) =
      __$$SettingResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'value') List<SettingModel>? value,
      @JsonKey(name: 'failureReason') String? failureReason,
      @JsonKey(name: 'isSuccess') bool? isSuccess});
}

/// @nodoc
class __$$SettingResultModelImplCopyWithImpl<$Res>
    extends _$SettingResultModelCopyWithImpl<$Res, _$SettingResultModelImpl>
    implements _$$SettingResultModelImplCopyWith<$Res> {
  __$$SettingResultModelImplCopyWithImpl(_$SettingResultModelImpl _value,
      $Res Function(_$SettingResultModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? failureReason = freezed,
    Object? isSuccess = freezed,
  }) {
    return _then(_$SettingResultModelImpl(
      value: freezed == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<SettingModel>?,
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
class _$SettingResultModelImpl implements _SettingResultModel {
  const _$SettingResultModelImpl(
      {@JsonKey(name: 'value') final List<SettingModel>? value,
      @JsonKey(name: 'failureReason') this.failureReason,
      @JsonKey(name: 'isSuccess') this.isSuccess})
      : _value = value;

  factory _$SettingResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingResultModelImplFromJson(json);

  final List<SettingModel>? _value;
  @override
  @JsonKey(name: 'value')
  List<SettingModel>? get value {
    final value = _value;
    if (value == null) return null;
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'failureReason')
  final String? failureReason;
  @override
  @JsonKey(name: 'isSuccess')
  final bool? isSuccess;

  @override
  String toString() {
    return 'SettingResultModel(value: $value, failureReason: $failureReason, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingResultModelImpl &&
            const DeepCollectionEquality().equals(other._value, _value) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_value), failureReason, isSuccess);

  /// Create a copy of SettingResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingResultModelImplCopyWith<_$SettingResultModelImpl> get copyWith =>
      __$$SettingResultModelImplCopyWithImpl<_$SettingResultModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingResultModelImplToJson(
      this,
    );
  }
}

abstract class _SettingResultModel implements SettingResultModel {
  const factory _SettingResultModel(
          {@JsonKey(name: 'value') final List<SettingModel>? value,
          @JsonKey(name: 'failureReason') final String? failureReason,
          @JsonKey(name: 'isSuccess') final bool? isSuccess}) =
      _$SettingResultModelImpl;

  factory _SettingResultModel.fromJson(Map<String, dynamic> json) =
      _$SettingResultModelImpl.fromJson;

  @override
  @JsonKey(name: 'value')
  List<SettingModel>? get value;
  @override
  @JsonKey(name: 'failureReason')
  String? get failureReason;
  @override
  @JsonKey(name: 'isSuccess')
  bool? get isSuccess;

  /// Create a copy of SettingResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingResultModelImplCopyWith<_$SettingResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddSettingResultModel _$AddSettingResultModelFromJson(
    Map<String, dynamic> json) {
  return _AddSettingResultModel.fromJson(json);
}

/// @nodoc
mixin _$AddSettingResultModel {
  @JsonKey(name: 'value')
  SettingModel? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'failureReason')
  String? get failureReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSuccess')
  bool? get isSuccess => throw _privateConstructorUsedError;

  /// Serializes this AddSettingResultModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddSettingResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddSettingResultModelCopyWith<AddSettingResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddSettingResultModelCopyWith<$Res> {
  factory $AddSettingResultModelCopyWith(AddSettingResultModel value,
          $Res Function(AddSettingResultModel) then) =
      _$AddSettingResultModelCopyWithImpl<$Res, AddSettingResultModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'value') SettingModel? value,
      @JsonKey(name: 'failureReason') String? failureReason,
      @JsonKey(name: 'isSuccess') bool? isSuccess});

  $SettingModelCopyWith<$Res>? get value;
}

/// @nodoc
class _$AddSettingResultModelCopyWithImpl<$Res,
        $Val extends AddSettingResultModel>
    implements $AddSettingResultModelCopyWith<$Res> {
  _$AddSettingResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddSettingResultModel
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
              as SettingModel?,
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

  /// Create a copy of AddSettingResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SettingModelCopyWith<$Res>? get value {
    if (_value.value == null) {
      return null;
    }

    return $SettingModelCopyWith<$Res>(_value.value!, (value) {
      return _then(_value.copyWith(value: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddSettingResultModelImplCopyWith<$Res>
    implements $AddSettingResultModelCopyWith<$Res> {
  factory _$$AddSettingResultModelImplCopyWith(
          _$AddSettingResultModelImpl value,
          $Res Function(_$AddSettingResultModelImpl) then) =
      __$$AddSettingResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'value') SettingModel? value,
      @JsonKey(name: 'failureReason') String? failureReason,
      @JsonKey(name: 'isSuccess') bool? isSuccess});

  @override
  $SettingModelCopyWith<$Res>? get value;
}

/// @nodoc
class __$$AddSettingResultModelImplCopyWithImpl<$Res>
    extends _$AddSettingResultModelCopyWithImpl<$Res,
        _$AddSettingResultModelImpl>
    implements _$$AddSettingResultModelImplCopyWith<$Res> {
  __$$AddSettingResultModelImplCopyWithImpl(_$AddSettingResultModelImpl _value,
      $Res Function(_$AddSettingResultModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddSettingResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? failureReason = freezed,
    Object? isSuccess = freezed,
  }) {
    return _then(_$AddSettingResultModelImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as SettingModel?,
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
class _$AddSettingResultModelImpl implements _AddSettingResultModel {
  const _$AddSettingResultModelImpl(
      {@JsonKey(name: 'value') this.value,
      @JsonKey(name: 'failureReason') this.failureReason,
      @JsonKey(name: 'isSuccess') this.isSuccess});

  factory _$AddSettingResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddSettingResultModelImplFromJson(json);

  @override
  @JsonKey(name: 'value')
  final SettingModel? value;
  @override
  @JsonKey(name: 'failureReason')
  final String? failureReason;
  @override
  @JsonKey(name: 'isSuccess')
  final bool? isSuccess;

  @override
  String toString() {
    return 'AddSettingResultModel(value: $value, failureReason: $failureReason, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSettingResultModelImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, failureReason, isSuccess);

  /// Create a copy of AddSettingResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddSettingResultModelImplCopyWith<_$AddSettingResultModelImpl>
      get copyWith => __$$AddSettingResultModelImplCopyWithImpl<
          _$AddSettingResultModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddSettingResultModelImplToJson(
      this,
    );
  }
}

abstract class _AddSettingResultModel implements AddSettingResultModel {
  const factory _AddSettingResultModel(
          {@JsonKey(name: 'value') final SettingModel? value,
          @JsonKey(name: 'failureReason') final String? failureReason,
          @JsonKey(name: 'isSuccess') final bool? isSuccess}) =
      _$AddSettingResultModelImpl;

  factory _AddSettingResultModel.fromJson(Map<String, dynamic> json) =
      _$AddSettingResultModelImpl.fromJson;

  @override
  @JsonKey(name: 'value')
  SettingModel? get value;
  @override
  @JsonKey(name: 'failureReason')
  String? get failureReason;
  @override
  @JsonKey(name: 'isSuccess')
  bool? get isSuccess;

  /// Create a copy of AddSettingResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddSettingResultModelImplCopyWith<_$AddSettingResultModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SettingModel _$SettingModelFromJson(Map<String, dynamic> json) {
  return _SettingModel.fromJson(json);
}

/// @nodoc
mixin _$SettingModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'collectionFrequency')
  int? get collectionFrequency => throw _privateConstructorUsedError;
  @JsonKey(name: 'pushFrequency')
  int? get pushFrequency => throw _privateConstructorUsedError;
  @JsonKey(name: 'distanceFilter')
  int? get distanceFilter => throw _privateConstructorUsedError;
  @JsonKey(name: 'accuracy')
  String? get accuracy => throw _privateConstructorUsedError;
  @JsonKey(name: 'startTime')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'endTime')
  String? get endTime => throw _privateConstructorUsedError;

  /// Serializes this SettingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SettingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingModelCopyWith<SettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingModelCopyWith<$Res> {
  factory $SettingModelCopyWith(
          SettingModel value, $Res Function(SettingModel) then) =
      _$SettingModelCopyWithImpl<$Res, SettingModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'userName') String? username,
      @JsonKey(name: 'collectionFrequency') int? collectionFrequency,
      @JsonKey(name: 'pushFrequency') int? pushFrequency,
      @JsonKey(name: 'distanceFilter') int? distanceFilter,
      @JsonKey(name: 'accuracy') String? accuracy,
      @JsonKey(name: 'startTime') String? startTime,
      @JsonKey(name: 'endTime') String? endTime});
}

/// @nodoc
class _$SettingModelCopyWithImpl<$Res, $Val extends SettingModel>
    implements $SettingModelCopyWith<$Res> {
  _$SettingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? collectionFrequency = freezed,
    Object? pushFrequency = freezed,
    Object? distanceFilter = freezed,
    Object? accuracy = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
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
      collectionFrequency: freezed == collectionFrequency
          ? _value.collectionFrequency
          : collectionFrequency // ignore: cast_nullable_to_non_nullable
              as int?,
      pushFrequency: freezed == pushFrequency
          ? _value.pushFrequency
          : pushFrequency // ignore: cast_nullable_to_non_nullable
              as int?,
      distanceFilter: freezed == distanceFilter
          ? _value.distanceFilter
          : distanceFilter // ignore: cast_nullable_to_non_nullable
              as int?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingModelImplCopyWith<$Res>
    implements $SettingModelCopyWith<$Res> {
  factory _$$SettingModelImplCopyWith(
          _$SettingModelImpl value, $Res Function(_$SettingModelImpl) then) =
      __$$SettingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'userName') String? username,
      @JsonKey(name: 'collectionFrequency') int? collectionFrequency,
      @JsonKey(name: 'pushFrequency') int? pushFrequency,
      @JsonKey(name: 'distanceFilter') int? distanceFilter,
      @JsonKey(name: 'accuracy') String? accuracy,
      @JsonKey(name: 'startTime') String? startTime,
      @JsonKey(name: 'endTime') String? endTime});
}

/// @nodoc
class __$$SettingModelImplCopyWithImpl<$Res>
    extends _$SettingModelCopyWithImpl<$Res, _$SettingModelImpl>
    implements _$$SettingModelImplCopyWith<$Res> {
  __$$SettingModelImplCopyWithImpl(
      _$SettingModelImpl _value, $Res Function(_$SettingModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? collectionFrequency = freezed,
    Object? pushFrequency = freezed,
    Object? distanceFilter = freezed,
    Object? accuracy = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$SettingModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      collectionFrequency: freezed == collectionFrequency
          ? _value.collectionFrequency
          : collectionFrequency // ignore: cast_nullable_to_non_nullable
              as int?,
      pushFrequency: freezed == pushFrequency
          ? _value.pushFrequency
          : pushFrequency // ignore: cast_nullable_to_non_nullable
              as int?,
      distanceFilter: freezed == distanceFilter
          ? _value.distanceFilter
          : distanceFilter // ignore: cast_nullable_to_non_nullable
              as int?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingModelImpl implements _SettingModel {
  const _$SettingModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'userName') this.username,
      @JsonKey(name: 'collectionFrequency') this.collectionFrequency,
      @JsonKey(name: 'pushFrequency') this.pushFrequency,
      @JsonKey(name: 'distanceFilter') this.distanceFilter,
      @JsonKey(name: 'accuracy') this.accuracy,
      @JsonKey(name: 'startTime') this.startTime,
      @JsonKey(name: 'endTime') this.endTime});

  factory _$SettingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'userName')
  final String? username;
  @override
  @JsonKey(name: 'collectionFrequency')
  final int? collectionFrequency;
  @override
  @JsonKey(name: 'pushFrequency')
  final int? pushFrequency;
  @override
  @JsonKey(name: 'distanceFilter')
  final int? distanceFilter;
  @override
  @JsonKey(name: 'accuracy')
  final String? accuracy;
  @override
  @JsonKey(name: 'startTime')
  final String? startTime;
  @override
  @JsonKey(name: 'endTime')
  final String? endTime;

  @override
  String toString() {
    return 'SettingModel(id: $id, username: $username, collectionFrequency: $collectionFrequency, pushFrequency: $pushFrequency, distanceFilter: $distanceFilter, accuracy: $accuracy, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.collectionFrequency, collectionFrequency) ||
                other.collectionFrequency == collectionFrequency) &&
            (identical(other.pushFrequency, pushFrequency) ||
                other.pushFrequency == pushFrequency) &&
            (identical(other.distanceFilter, distanceFilter) ||
                other.distanceFilter == distanceFilter) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      collectionFrequency,
      pushFrequency,
      distanceFilter,
      accuracy,
      startTime,
      endTime);

  /// Create a copy of SettingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingModelImplCopyWith<_$SettingModelImpl> get copyWith =>
      __$$SettingModelImplCopyWithImpl<_$SettingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingModelImplToJson(
      this,
    );
  }
}

abstract class _SettingModel implements SettingModel {
  const factory _SettingModel(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'userName') final String? username,
      @JsonKey(name: 'collectionFrequency') final int? collectionFrequency,
      @JsonKey(name: 'pushFrequency') final int? pushFrequency,
      @JsonKey(name: 'distanceFilter') final int? distanceFilter,
      @JsonKey(name: 'accuracy') final String? accuracy,
      @JsonKey(name: 'startTime') final String? startTime,
      @JsonKey(name: 'endTime') final String? endTime}) = _$SettingModelImpl;

  factory _SettingModel.fromJson(Map<String, dynamic> json) =
      _$SettingModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'userName')
  String? get username;
  @override
  @JsonKey(name: 'collectionFrequency')
  int? get collectionFrequency;
  @override
  @JsonKey(name: 'pushFrequency')
  int? get pushFrequency;
  @override
  @JsonKey(name: 'distanceFilter')
  int? get distanceFilter;
  @override
  @JsonKey(name: 'accuracy')
  String? get accuracy;
  @override
  @JsonKey(name: 'startTime')
  String? get startTime;
  @override
  @JsonKey(name: 'endTime')
  String? get endTime;

  /// Create a copy of SettingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingModelImplCopyWith<_$SettingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
