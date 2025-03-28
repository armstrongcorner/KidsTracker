// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationHiveModelAdapter extends TypeAdapter<LocationHiveModel> {
  @override
  final int typeId = 0;

  @override
  LocationHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationHiveModel(
      username: fields[0] as String?,
      latitude: (fields[1] as num?)?.toDouble(),
      longitude: (fields[2] as num?)?.toDouble(),
      speed: (fields[3] as num?)?.toDouble(),
      direction: (fields[4] as num?)?.toDouble(),
      dateTimeOcurred: (fields[5] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, LocationHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.latitude)
      ..writeByte(2)
      ..write(obj.longitude)
      ..writeByte(3)
      ..write(obj.speed)
      ..writeByte(4)
      ..write(obj.direction)
      ..writeByte(5)
      ..write(obj.dateTimeOcurred);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
