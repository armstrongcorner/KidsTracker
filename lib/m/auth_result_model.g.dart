// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResultModelImpl _$$AuthResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthResultModelImpl(
      value: json['value'] == null
          ? null
          : AuthModel.fromJson(json['value'] as Map<String, dynamic>),
      failureReason: json['failureReason'] as String?,
      isSuccess: json['isSuccess'] as bool?,
    );

Map<String, dynamic> _$$AuthResultModelImplToJson(
        _$AuthResultModelImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'failureReason': instance.failureReason,
      'isSuccess': instance.isSuccess,
    };

_$AuthModelImpl _$$AuthModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthModelImpl(
      token: json['token'] as String?,
      validInMins: (json['validInMins'] as num?)?.toInt(),
      validUntilUTC: json['validUntilUTC'] as String?,
    );

Map<String, dynamic> _$$AuthModelImplToJson(_$AuthModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'validInMins': instance.validInMins,
      'validUntilUTC': instance.validUntilUTC,
    };
