import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:review_hub/model/sign_up_model.dart';


ValueNotifier<List<SignUpModel>> usersDetails = ValueNotifier([]);

getUserData() async {
  // ignore: no_leading_underscores_for_local_identifiers
  final _db = await Hive.openBox<SignUpModel>('signUp');
  usersDetails.value.clear();
  usersDetails.value.addAll(_db.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  usersDetails.notifyListeners();
}
