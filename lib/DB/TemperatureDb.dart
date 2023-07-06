

import 'package:hive_flutter/hive_flutter.dart';
part 'TemperatureDb.g.dart';
@HiveType(typeId: 3)
class TemperatureDb{
  @HiveField(0)
  String? uid;

  @HiveField(1)
  double? temperature;

  @HiveField(2)
  String? date;

  TemperatureDb({
    this.uid,
    this.temperature,
    this.date,
  });

}