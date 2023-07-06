import 'package:hive_flutter/hive_flutter.dart';
part 'HeartRateDb.g.dart';
@HiveType(typeId: 1)
class HeartRateDb {
  @HiveField(0)
   String? uid;

   @HiveField(1)
   double? heartRate;

  @HiveField(2)
   String? date;

   HeartRateDb({this.uid, this.heartRate, this.date});
  
}