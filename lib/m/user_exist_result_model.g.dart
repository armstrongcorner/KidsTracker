// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_exist_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserExistResultModelImpl _$$UserExistResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserExistResultModelImpl(
      value: json['value'] as bool?,
      failureReason: json['failureReason'] as String?,
      isSuccess: json['isSuccess'] as bool?,
    );

Map<String, dynamic> _$$UserExistResultModelImplToJson(
        _$UserExistResultModelImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'failureReason': instance.failureReason,
      'isSuccess': instance.isSuccess,
    };
