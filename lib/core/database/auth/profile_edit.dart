import 'package:first_project/core/database/auth/get_user_db.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:hive_flutter/adapters.dart';



profileEdit(String userId, SignUpModel value) async {
  // ignore: no_leading_underscores_for_local_identifiers
  final _db = await Hive.openBox<SignUpModel>('signUp');
  _db.put(userId, value);
  getUserData();
}
