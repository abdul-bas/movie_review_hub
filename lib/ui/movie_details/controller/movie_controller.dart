import 'package:first_project/core/database/movie_oprations/comment.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:flutter/material.dart';

class MovieController {
  
 static void submitComment(TextEditingController controller, SignUpModel usermodel, MovieModel movieModel) {
    final comment = controller.text.trim();
    if (comment.isEmpty) return;
    commentAdd(
      movieId: movieModel.id!,
      userId: usermodel.id!,
      comment: comment,
    );
    controller.clear();
  }
}