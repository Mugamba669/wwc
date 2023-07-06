// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TemperatureDb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TemperatureDbAdapter extends TypeAdapter<TemperatureDb> {
  @override
  final int typeId = 3;

  @override
  TemperatureDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TemperatureDb(
      uid: fields[0] as String?,
      temperature: fields[1] as double?,
      date: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TemperatureDb obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.temperature)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemperatureDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
