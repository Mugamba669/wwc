import 'package:hive_flutter/hive_flutter.dart';

part 'StepsDb.g.dart';
  @HiveType(typeId: 2)

class StepsDb {
  @HiveField(0)
  String? uid;

  @HiveField(1)
  double? steps;

  @HiveField(2)
  String? date;

  StepsDb({
    this.uid,
    this.steps,
    this.date,
  });
}