import 'package:hive_flutter/adapters.dart';
part 'HoursDb.g.dart';
@HiveType(typeId: 5)
class HoursDb{
  @HiveField(0)
  int? hours;

  @HiveField(1)
  String? date;
  HoursDb({this.hours, this.date});
}