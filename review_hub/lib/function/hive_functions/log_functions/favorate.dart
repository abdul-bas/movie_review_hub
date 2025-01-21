import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/depending_data/snacbar.dart';
import 'package:review_hub/function/hive_functions/log_functions/get_user_db.dart';
import 'package:review_hub/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:review_hub/model/sign_up_model.dart';


Future<void> favorate({
  required SignUpModel model,
  required String movieid,
  required BuildContext context,
}) async {
  try {
    // Open the Hive database
    // ignore: no_leading_underscores_for_local_identifiers
    final _db = await Hive.openBox<SignUpModel>('signUp');
    final key = model.id;

    if (key == null) {
      debugPrint('Model ID is null.');
      return;
    }

    // Retrieve the stored model
    final storedModel = _db.get(key);
    if (storedModel == null) {
      debugPrint('Model not found in the database.');
      return;
    }

    // Toggle favorite status
    bool isFavorite = storedModel.isFavorate[movieid] ?? false;
    storedModel.isFavorate[movieid] = !isFavorite;

    // Update the database
    await _db.put(key, storedModel);
    getUserData();

    // Show SnackBar based on the new status
    if (context.mounted) {
      if (storedModel.isFavorate[movieid] == true) {
        SnackBarFunction(context: context, text: 'Marked as favorite', color: blue);
      } else {
        SnackBarFunction(context: context, text: 'Favorite removed');
      }
    }

    // Debug log
    debugPrint('Favorite status of movie $movieid updated to ${!isFavorite}');

    // Refresh movie and user data
    getMovie();
    getUserData();
  } catch (e) {
    debugPrint('Error in favorate function: $e');
  }
}