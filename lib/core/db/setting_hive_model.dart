import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:kids_tracker/m/setting_result_model.dart';

import '../constant.dart';

part 'setting_hive_model.g.dart';

@HiveType(typeId: BOX_TYPE_ID_SETTING)
class SettingHiveModel extends HiveObject {
  SettingHiveModel({
    this.id,
    this.userName,
    this.collectionFrequency,
    this.pushFrequency,
    this.distanceFilter,
    this.startTime,
    this.endTime,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? userName;
  @HiveField(2)
  int? collectionFrequency;
  @HiveField(3)
  int? pushFrequency;
  @HiveField(4)
  int? distanceFilter;
  @HiveField(5)
  String? startTime;
  @HiveField(6)
  String? endTime;

  @override
  String toString() {
    return '{id: $id, userName: $userName, collectionFrequency: $collectionFrequency, pushFrequency: $pushFrequency, distanceFilter: $distanceFilter, startTime: $startTime, endTime: $endTime}';
  }

  factory SettingHiveModel.fromJson(Map<String, dynamic> json) =>
      SettingHiveModel(
        id: json['id'],
        userName: json['userName'],
        collectionFrequency: json['collectionFrequency'],
        pushFrequency: json['pushFrequency'],
        distanceFilter: json['distanceFilter'],
        startTime: json['startTime'],
        endTime: json['endTime'],
      );

  factory SettingHiveModel.fromSettingModel(SettingModel settingModel) =>
      SettingHiveModel(
        id: settingModel.id,
        userName: settingModel.username,
        collectionFrequency: settingModel.collectionFrequency,
        pushFrequency: settingModel.pushFrequency,
        distanceFilter: settingModel.distanceFilter,
        startTime: settingModel.startTime,
        endTime: settingModel.endTime,
      );

  SettingModel toSettingModel() => SettingModel(
        id: id,
        username: userName,
        collectionFrequency: collectionFrequency,
        pushFrequency: pushFrequency,
        distanceFilter: distanceFilter,
        startTime: startTime,
        endTime: endTime,
      );
}
