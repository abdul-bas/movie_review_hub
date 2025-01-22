import 'package:first_project/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:hive_flutter/adapters.dart';


addSignUp(SignUpModel data) async {
  // ignore: no_leading_underscores_for_local_identifiers
  final _db = await Hive.openBox<SignUpModel>('signUp');
  String customId = DateTime.now().millisecondsSinceEpoch.toString();
  data.id = customId;
 await _db.put(data.id, data);
  getMovie();
}
