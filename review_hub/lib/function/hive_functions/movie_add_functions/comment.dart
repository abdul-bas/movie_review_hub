import 'package:hive_flutter/adapters.dart';
import 'package:review_hub/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:review_hub/model/movie_model.dart';


commentAdd(
    {required String movieId,
    required String userId,
    required String comment}) async {
  // ignore: no_leading_underscores_for_local_identifiers
  final _db = await Hive.openBox<MovieModel>('movie');
  final model = _db.values.firstWhere(
    (element) => element.id == movieId,
  );
  final key = model.id;
  // ignore: prefer_conditional_assignment
  if (model.comment == null) {
    model.comment = [];
  }
  // ignore: prefer_conditional_assignment
  if (model.userId == null) {
    model.userId = [];
  }
  final commentWithDate = {
    'comment': comment,
    'timestamp':DateTime.now(), // ISO 8601 format for timestamp
  };

  model.userId!.add(userId);
  model.comment!.add(commentWithDate);
  await _db.put(key, model);
  getMovie();
  // ignore: avoid_print
  print('sucsessfull..................');
}
