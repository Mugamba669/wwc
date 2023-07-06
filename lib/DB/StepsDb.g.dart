// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StepsDb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StepsDbAdapter extends TypeAdapter<StepsDb> {
  @override
  final int typeId = 2;

  @override
  StepsDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StepsDb(
      uid: fields[0] as String?,
      steps: fields[1] as double?,
      date: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StepsDb obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.steps)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepsDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
