// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingResultModelImpl _$$SettingResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SettingResultModelImpl(
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => SettingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      failureReason: json['failureReason'] as String?,
      isSuccess: json['isSuccess'] as bool?,
    );

Map<String, dynamic> _$$SettingResultModelImplToJson(
        _$SettingResultModelImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'failureReason': instance.failureReason,
      'isSuccess': instance.isSuccess,
    };

_$AddSettingResultModelImpl _$$AddSettingResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AddSettingResultModelImpl(
      value: json['value'] == null
          ? null
          : SettingModel.fromJson(json['value'] as Map<String, dynamic>),
      failureReason: json['failureReason'] as String?,
      isSuccess: json['isSuccess'] as bool?,
    );

Map<String, dynamic> _$$AddSettingResultModelImplToJson(
        _$AddSettingResultModelImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'failureReason': instance.failureReason,
      'isSuccess': instance.isSuccess,
    };

_$SettingModelImpl _$$SettingModelImplFromJson(Map<String, dynamic> json) =>
    _$SettingModelImpl(
      id: (json['id'] as num?)?.toInt(),
      username: json['userName'] as String?,
      collectionFrequency: (json['collectionFrequency'] as num?)?.toInt(),
      pushFrequency: (json['pushFrequency'] as num?)?.toInt(),
      distanceFilter: (json['distanceFilter'] as num?)?.toInt(),
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
    );

Map<String, dynamic> _$$SettingModelImplToJson(_$SettingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.username,
      'collectionFrequency': instance.collectionFrequency,
      'pushFrequency': instance.pushFrequency,
      'distanceFilter': instance.distanceFilter,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
