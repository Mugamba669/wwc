import 'package:hive/hive.dart';

part 'Register.g.dart';

@HiveType(typeId: 0)
class Register {
  @HiveField(0)
  String? username;

  @HiveField(1)
  String? gender;

  @HiveField(2)
  String? dateOfBith;

  @HiveField(3)
  String? bodyWeight;

  @HiveField(4)
  String? height;
  
  @HiveField(5)
  String? phoneNumber;

  @HiveField(6)
  String? password;

  Register({this.bodyWeight, this.height, this.dateOfBith, this.gender, this.username, this.password, this.phoneNumber});
}
