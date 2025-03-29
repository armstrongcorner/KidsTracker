import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_result_model.freezed.dart';
part 'setting_result_model.g.dart';

@freezed
class SettingResultModel with _$SettingResultModel {
  const factory SettingResultModel({
    @JsonKey(name: 'value') List<SettingModel>? value,
    @JsonKey(name: 'failureReason') String? failureReason,
    @JsonKey(name: 'isSuccess') bool? isSuccess,
  }) = _SettingResultModel;

  factory SettingResultModel.fromJson(Map<String, dynamic> json) =>
      _$SettingResultModelFromJson(json);
}

@freezed
class AddSettingResultModel with _$AddSettingResultModel {
  const factory AddSettingResultModel({
    @JsonKey(name: 'value') SettingModel? value,
    @JsonKey(name: 'failureReason') String? failureReason,
    @JsonKey(name: 'isSuccess') bool? isSuccess,
  }) = _AddSettingResultModel;

  factory AddSettingResultModel.fromJson(Map<String, dynamic> json) =>
      _$AddSettingResultModelFromJson(json);
}

@freezed
class SettingModel with _$SettingModel {
  const factory SettingModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'userName') String? username,
    @JsonKey(name: 'collectionFrequency') int? collectionFrequency,
    @JsonKey(name: 'pushFrequency') int? pushFrequency,
    @JsonKey(name: 'distanceFilter') int? distanceFilter,
    @JsonKey(name: 'accuracy') String? accuracy,
    @JsonKey(name: 'startTime') String? startTime,
    @JsonKey(name: 'endTime') String? endTime,
  }) = _SettingModel;

  factory SettingModel.fromJson(Map<String, dynamic> json) =>
      _$SettingModelFromJson(json);
}
