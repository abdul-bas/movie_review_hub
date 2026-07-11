import 'package:first_project/core/database/auth/get_user_db.dart';
import 'package:first_project/core/database/movie_oprations/get_movie.dart';
import 'package:first_project/ui/movie_deteals/movie_details.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:first_project/routes/push_replacement_bottom.dart';
import 'package:flutter/material.dart';

class FavoriteController {
  final SignUpModel user; 

  FavoriteController({required this.user});

  List<MovieModel> getFavoriteMovies(
    List<SignUpModel> users,
    List<MovieModel> movies,
  ) {
    final currentUser = _resolveUser(users);
    return movies
        .where((movie) => currentUser.isFavorate[movie.id] == true)
        .toList();
  }

  SignUpModel resolveUser(List<SignUpModel> users) => _resolveUser(users);

  SignUpModel _resolveUser(List<SignUpModel> users) =>
      users.firstWhere((u) => u.id == user.id);

  void init() {
    getMovie();
    getUserData();
  }
  
 static void goToDetails(BuildContext context, MovieModel movie ,SignUpModel currentUser) {
    navigateFromBottom(
      context,
      MovieDetailsScreen(
        id: movie.id!,
        url: movie.link,
        userId: currentUser.id,
      ),
    );
  }
}