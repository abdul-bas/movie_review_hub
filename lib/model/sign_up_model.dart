import 'package:hive_flutter/adapters.dart';
part 'sign_up_model.g.dart';

@HiveType(typeId: 1)
class SignUpModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  final String fullName;
  @HiveField(2)
  final String password;
  @HiveField(3)
  final String email;
  @HiveField(4)
  bool isLog;
  @HiveField(5)
  Map<String, int> index;
  @HiveField(6)
  Map<String, bool> isFavorate;
  @HiveField(7)
  String? image;
  SignUpModel({
    required this.fullName,
    required this.password,
    required this.email,
    required this.isLog,
    this.id,this.image,
    Map<String, int>? index,
    Map<String, bool>? isFavorate,
  })  : index = index ?? {},
        isFavorate = isFavorate ?? {};
}
