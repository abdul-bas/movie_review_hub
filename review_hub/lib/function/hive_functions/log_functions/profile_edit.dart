import 'package:hive_flutter/adapters.dart';
import 'package:review_hub/function/hive_functions/log_functions/get_user_db.dart';
import 'package:review_hub/model/sign_up_model.dart';


profileEdit(String userId, SignUpModel value) async {
  // ignore: no_leading_underscores_for_local_identifiers
  final _db = await Hive.openBox<SignUpModel>('signUp');
  _db.put(userId, value);
  getUserData();
}
