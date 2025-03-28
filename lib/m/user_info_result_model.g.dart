// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoResultModelImpl _$$UserInfoResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserInfoResultModelImpl(
      value: json['value'] == null
          ? null
          : UserInfoModel.fromJson(json['value'] as Map<String, dynamic>),
      failureReason: json['failureReason'] as String?,
      isSuccess: json['isSuccess'] as bool?,
    );

Map<String, dynamic> _$$UserInfoResultModelImplToJson(
        _$UserInfoResultModelImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'failureReason': instance.failureReason,
      'isSuccess': instance.isSuccess,
    };

_$UserInfoModelImpl _$$UserInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoModelImpl(
      id: (json['id'] as num?)?.toInt(),
      username: json['userName'] as String?,
      passwordEncrypted: json['password'] as String?,
      role: json['role'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      tokenDurationInMin: (json['tokenDurationInMin'] as num?)?.toInt(),
      isActive: json['isActive'] as bool?,
      serviceLevel: (json['serviceLevel'] as num?)?.toInt(),
      language: json['language'] as String?,
      createdDateTime: json['createdDateTime'] as String?,
      updatedDateTime: json['updatedDateTime'] as String?,
      createdBy: json['createdBy'] as String?,
      updatedBy: json['updatedBy'] as String?,
    );

Map<String, dynamic> _$$UserInfoModelImplToJson(_$UserInfoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.username,
      'password': instance.passwordEncrypted,
      'role': instance.role,
      'mobile': instance.mobile,
      'email': instance.email,
      'tokenDurationInMin': instance.tokenDurationInMin,
      'isActive': instance.isActive,
      'serviceLevel': instance.serviceLevel,
      'language': instance.language,
      'createdDateTime': instance.createdDateTime,
      'updatedDateTime': instance.updatedDateTime,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
    };
