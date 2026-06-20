import 'package:first_project/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> movieAdd(MovieModel value) async {
  // ignore: no_leading_underscores_for_local_identifiers
  final _db = await Hive.openBox<MovieModel>('movie');
  String customId = DateTime.now().millisecondsSinceEpoch.toString();
  value.id = customId;
  _db.put(value.id, value);
  getMovie();
}
