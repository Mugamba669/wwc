// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HoursDb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HoursDbAdapter extends TypeAdapter<HoursDb> {
  @override
  final int typeId = 5;

  @override
  HoursDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HoursDb(
      hours: fields[0] as int?,
      date: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HoursDb obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hours)
      ..writeByte(1)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HoursDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
