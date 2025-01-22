import 'package:first_project/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';



ValueNotifier<List<MovieModel>> movieDetailes = ValueNotifier([]);
Future<void> getMovie() async {
  // ignore: no_leading_underscores_for_local_identifiers
  final _db = await Hive.openBox<MovieModel>('movie');
  movieDetailes.value.clear();
  movieDetailes.value.addAll(_db.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  movieDetailes.notifyListeners();
}
