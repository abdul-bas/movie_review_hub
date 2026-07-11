import 'package:first_project/config/genre_config.dart';
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/genre/widgets/app_bar.dart';
import 'package:first_project/ui/genre/widgets/movie_feed.dart';
import 'package:flutter/material.dart';

class GenreScreen extends StatelessWidget {
  const GenreScreen({
    super.key,
    required this.userId,
    required this.config,
  });

  final String userId;
  final GenreConfig config;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
      slivers: [
        GenreSliverAppBar(config: config),
        GenreMovieFeed(userId: userId, config: config),
      ],
    ),
    );
  }
}
