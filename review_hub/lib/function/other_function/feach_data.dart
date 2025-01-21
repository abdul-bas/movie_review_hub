import 'package:flutter/material.dart';
import 'package:review_hub/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:review_hub/model/movie_model.dart';

MovieModel featch({required id}) {
  final data = movieDetailes.value.firstWhere(
    (element) => element.id == id,
  );
  getMovie();
  return data;
}

feachToPopUp(
    {required id,
    required ValueNotifier<List<String>> movieImages,
    required ValueNotifier<List<String>> castImages,
    required ValueNotifier<List<String>> castNames}) async {
  // ignore: await_only_futures
  final data = await featch(id: id);
  movieImages.value.addAll(data.movieImages);
  castImages.value.addAll(data.castImages);
  castNames.value.addAll(data.castNames);
}
