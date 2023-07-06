import 'package:hive_flutter/hive_flutter.dart';
part 'AdvisoryDb.g.dart';
@HiveType(typeId: 4)
class AdvisoryDb {
  @HiveField(0)
  String? advisoryId;

  @HiveField(1)
  String? highTempAdvisory;

  @HiveField(2)
  String? lowTempAdvisory;

  @HiveField(3)
  String? highHeartRateAdvisory;

  @HiveField(4)
  String? unsteadyWalkAdvisory;

  @HiveField(5)
  String? insufficientSleepAdvisory;

  AdvisoryDb({
    this.advisoryId,
    this.highTempAdvisory,
    this.lowTempAdvisory,
    this.highHeartRateAdvisory,
    this.unsteadyWalkAdvisory,
    this.insufficientSleepAdvisory,
  });

}