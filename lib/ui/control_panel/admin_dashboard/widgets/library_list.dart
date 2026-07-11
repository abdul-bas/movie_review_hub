
import 'package:first_project/ui/control_panel/admin_dashboard/controller/controller.dart';
import 'package:first_project/ui/control_panel/admin_dashboard/widgets/movie_list_tile.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:flutter/material.dart';

class MovieLibraryList extends StatelessWidget {
  const MovieLibraryList({super.key, 
    required this.movies,
    required this.userId,
    required this.controller,
  });

  final List<MovieModel> movies;
  final String userId;
  final AdminDashboardController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: movies.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MovieListTile(
          movie: movie,
          onTap: () => controller.openMovieDetails(context, movie, userId),
          onEdit: () => controller.editMovie(context, movie),
          onDelete: () => controller.deleteMovie(context, movie),
        );
      },
    );
  }
}
