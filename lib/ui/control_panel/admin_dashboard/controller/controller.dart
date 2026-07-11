
import 'package:first_project/ui/control_panel/movie_management/controller/form_controller.dart';
import 'package:first_project/ui/control_panel/movie_management/create_movies/create_movies.dart';
import 'package:first_project/ui/control_panel/movie_management/delete/delete_movie.dart';
import 'package:first_project/ui/control_panel/movie_management/dialogs/cast_dialog.dart';
import 'package:first_project/ui/control_panel/movie_management/update_movies/update_movies.dart';
import 'package:first_project/ui/movie_deteals/movie_details.dart';

import 'package:first_project/model/movie_model.dart';
import 'package:first_project/routes/bottom_push.dart';
import 'package:first_project/routes/center_push.dart';
import 'package:first_project/routes/side_push.dart';

import 'package:flutter/material.dart';

class AdminDashboardController {
  const AdminDashboardController();

  List<MovieModel> filterMovies(List<MovieModel> movies, String query) {
    if (query.isEmpty) return movies;
    return movies
        .where((m) => m.tittle.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  
  Offset initialFabPosition(double screenWidth) {
    return screenWidth < 500
        ? const Offset(170, 750)
        : const Offset(270, 450);
  }

  void deleteMovie(BuildContext context, MovieModel movie) {
    showDialog(
      context: context,
      builder: (_) => DeleteMovieDialog(
        movieId: movie.id!,
        movieTitle: movie.tittle,
      ),
    );
  }

  void editMovie(BuildContext context, MovieModel movie) {
    navigateFromSide(context, MovieEditPage(movieId: movie.id!));
  }

  void openMovieDetails(BuildContext context, MovieModel movie, String userId) {
    navigateFromCenter(
      context: context,
      navigation: MovieDetailsScreen(
        id: movie.id!,
        userId: userId,
        url: movie.link,
      ),
    );
  }

  void openAddMovie(BuildContext context) {
    navigateFromBottomPush(context, MovieAddingPage());
  }
 static void openAddCastDialog(BuildContext context, MovieFormController  controller) {
    showDialog(
      context: context,
      builder: (_) => AddCastDialog(controller: controller),
    );
  }
}