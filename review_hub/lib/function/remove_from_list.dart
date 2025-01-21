import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:review_hub/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:review_hub/model/movie_model.dart';


remove({index, castImages, castNames}) {
  castImages.value.removeAt(index);
  castImages.notifyListeners();
  castNames.value.removeAt(index);
  castNames.notifyListeners();
}

Future<void> listRemovig(
    {required id, required index, required context, required ValueNotifier<List<String>> list,}) async {
  // ignore: no_leading_underscores_for_local_identifiers
  final _db = await Hive.openBox<MovieModel>('movie');
  final model = _db.values.firstWhere((e) => e.id == id);
  if (model.movieImages.length >= 2) {
    model.movieImages.removeAt(index);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    movieDetailes.notifyListeners();

    // Save the updated model back to the database
    await _db.put(model.id, model);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    list.notifyListeners();
  } else {
    // ignore: avoid_print
    print('less than 1');
  }
}
