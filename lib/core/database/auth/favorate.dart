import 'package:first_project/core/utils/snack_bar/snacbar.dart';
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/core/database/auth/get_user_db.dart';
import 'package:first_project/core/database/movie_oprations/get_movie.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> favorate({
  required SignUpModel model,
  required String movieid,
  required BuildContext context,
}) async {
  try {
    final _db = await Hive.openBox<SignUpModel>('signUp');
    final key = model.id;

    if (key == null) {
      debugPrint('Model ID is null.');
      return;
    }

    final storedModel = _db.get(key);
    if (storedModel == null) {
      debugPrint('Model not found in the database.');
      return;
    }

    bool isFavorite = storedModel.isFavorate[movieid] ?? false;
    storedModel.isFavorate[movieid] = !isFavorite;

    await _db.put(key, storedModel);
    getUserData();

    if (context.mounted) {
      if (storedModel.isFavorate[movieid] == true) {
        snackBarFunction(
            context: context,
            text: 'Marked as favorite',
            color: AppColors.blue);
      } else {
        snackBarFunction(context: context, text: 'Favorite removed');
      }
    }

    debugPrint('Favorite status of movie $movieid updated to ${!isFavorite}');

    getMovie();
    getUserData();
  } catch (e) {
    debugPrint('Error in favorate function: $e');
  }
}
