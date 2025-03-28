import 'package:geolocator/geolocator.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../constant.dart';

part 'location_hive_model.g.dart';

@HiveType(typeId: BOX_TYPE_ID_LOCATION)
class LocationHiveModel extends HiveObject {
  LocationHiveModel({
    this.username,
    this.latitude,
    this.longitude,
    this.speed,
    this.direction,
    this.dateTimeOcurred,
  });

  @HiveField(0)
  String? username;
  @HiveField(1)
  double? latitude;
  @HiveField(2)
  double? longitude;
  @HiveField(3)
  double? speed;
  @HiveField(4)
  double? direction;
  @HiveField(5)
  int? dateTimeOcurred;

  @override
  String toString() {
    return '{id: $username, role: $latitude, content: $longitude, speed: $speed, direction: $direction, dateTimeOcurred: $dateTimeOcurred}';
  }

  factory LocationHiveModel.fromPosition(Position position, String username) =>
      LocationHiveModel(
        username: username,
        latitude: position.latitude,
        longitude: position.longitude,
        speed: position.speed,
        direction: position.heading,
        dateTimeOcurred: position.timestamp.millisecondsSinceEpoch,
      );
}
