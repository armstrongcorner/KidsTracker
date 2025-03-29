// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingHiveModelAdapter extends TypeAdapter<SettingHiveModel> {
  @override
  final int typeId = 1;

  @override
  SettingHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingHiveModel(
      id: (fields[0] as num?)?.toInt(),
      userName: fields[1] as String?,
      collectionFrequency: (fields[2] as num?)?.toInt(),
      pushFrequency: (fields[3] as num?)?.toInt(),
      distanceFilter: (fields[4] as num?)?.toInt(),
      accuracy: fields[5] as String?,
      startTime: fields[6] as String?,
      endTime: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SettingHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.collectionFrequency)
      ..writeByte(3)
      ..write(obj.pushFrequency)
      ..writeByte(4)
      ..write(obj.distanceFilter)
      ..writeByte(5)
      ..write(obj.accuracy)
      ..writeByte(6)
      ..write(obj.startTime)
      ..writeByte(7)
      ..write(obj.endTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
