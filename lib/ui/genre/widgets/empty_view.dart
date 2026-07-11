
import 'package:first_project/config/genre_config.dart';
import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyGenreView extends StatelessWidget {
  const EmptyGenreView({super.key, required this.config});

  final GenreConfig config;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(config.icon, size: 56, color: AppColors.onSurfaceSubtle),
            const SizedBox(height: 16),
             Text(
              'No movies available',
              style: TextStyle(
                color: AppColors.onSurface,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Check back soon for ${config.genre} titles',
              style:  TextStyle(
                color: AppColors.onSurfaceSubtle,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
