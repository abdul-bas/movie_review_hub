import 'package:first_project/core/database/movie_oprations/feach_data.dart';
import 'package:flutter/material.dart';


dynamic feachToPopUp(
    {required String id,
    required ValueNotifier<List<String>> movieImages,
    required ValueNotifier<List<String>> castImages,
    required ValueNotifier<List<String>> castNames}) async {
  // ignore: await_only_futures
  final data = await featch(id: id);
  movieImages.value.addAll(data.movieImages);
  castImages.value.addAll(data.castImages);
  castNames.value.addAll(data.castNames);
}
