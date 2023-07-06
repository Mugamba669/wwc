// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdvisoryDb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdvisoryDbAdapter extends TypeAdapter<AdvisoryDb> {
  @override
  final int typeId = 4;

  @override
  AdvisoryDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdvisoryDb(
      advisoryId: fields[0] as String?,
      highTempAdvisory: fields[1] as String?,
      lowTempAdvisory: fields[2] as String?,
      highHeartRateAdvisory: fields[3] as String?,
      unsteadyWalkAdvisory: fields[4] as String?,
      insufficientSleepAdvisory: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AdvisoryDb obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.advisoryId)
      ..writeByte(1)
      ..write(obj.highTempAdvisory)
      ..writeByte(2)
      ..write(obj.lowTempAdvisory)
      ..writeByte(3)
      ..write(obj.highHeartRateAdvisory)
      ..writeByte(4)
      ..write(obj.unsteadyWalkAdvisory)
      ..writeByte(5)
      ..write(obj.insufficientSleepAdvisory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdvisoryDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
