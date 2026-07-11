import 'package:first_project/config/genre_config.dart';
import 'package:first_project/ui/genre/widgets/empty_view.dart';
import 'package:first_project/ui/genre/widgets/movie_page.dart';
import 'package:first_project/core/database/movie_oprations/get_movie.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:flutter/material.dart';


class GenreMovieFeed extends StatelessWidget {
  const GenreMovieFeed({
    super.key,
    required this.userId,
    required this.config,
  });

  final String userId;
  final GenreConfig config;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<MovieModel>>(
      valueListenable: movieDetailes,
      builder: (context, movies, _) {
        final filtered = movies
            .where((m) => m.genre == config.genre)
            .toList();

        if (filtered.isEmpty) {
          return EmptyGenreView(config: config);
        }

        return SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                return MoviePage(
                  movie: filtered[index],
                  accentColor: config.accentColor,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

// ── Empty state ───────────────────────────────────────────────────────────────

// ── Single movie page ─────────────────────────────────────────────────────────
