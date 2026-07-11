import 'package:first_project/core/database/movie_oprations/get_movie.dart';

import 'package:first_project/model/movie_model.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> deleteMovie({required id, required context}) async {
  // ignore: no_leading_underscores_for_local_identifiers
  final _db = await Hive.openBox<MovieModel>('movie');
  if (id != null) {
    _db.delete(id);

    movieDetailes.value.clear();
    movieDetailes.value.addAll(_db.values);
    movieDetailes.notifyListeners();
  } else {}
}
