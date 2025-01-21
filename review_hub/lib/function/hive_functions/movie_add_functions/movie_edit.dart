import 'package:hive_flutter/adapters.dart';
import 'package:review_hub/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:review_hub/model/movie_model.dart';


Future<void> movieEdit(MovieModel value, String id) async {
  // ignore: no_leading_underscores_for_local_identifiers
  final _db = await Hive.openBox<MovieModel>('movie');

  _db.put(id, value);
  getMovie();
}
