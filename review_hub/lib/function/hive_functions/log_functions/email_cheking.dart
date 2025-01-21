import 'package:hive_flutter/adapters.dart';
import 'package:review_hub/model/sign_up_model.dart';

emailCheking(text) async {
  // ignore: no_leading_underscores_for_local_identifiers
  final _db = await Hive.openBox<SignUpModel>('signUp');
  // ignore: await_only_futures
  bool model =  await _db.values.any(((e) => e.email == text));
  return model;
}
