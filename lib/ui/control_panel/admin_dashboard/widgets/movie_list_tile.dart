import 'dart:io';

import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/control_panel/admin_dashboard/widgets/action_button.dart';
import 'package:first_project/ui/control_panel/admin_dashboard/widgets/badge.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:flutter/material.dart';
class MovieListTile extends StatelessWidget {
  const MovieListTile({
    super.key,
    required this.movie,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  final MovieModel movie;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final hasImage = movie.movieImages.isNotEmpty;

    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppColors.cardRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppColors.cardRadius),
        splashColor: AppColors.accent.withValues(alpha: 0.06),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(AppColors.cardRadius),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: hasImage
                    ? Image.file(
                        File(movie.movieImages[0]),
                        width: 84,
                        height: 84,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 84,
                          height: 84,
                          color: AppColors.surfaceElevated,
                          child:  Icon(
                            Icons.movie_outlined,
                            color: AppColors.onSurfaceSubtle,
                          ),
                        ),
                      )
                    : Container(
                        width: 84,
                        height: 84,
                        color: AppColors.surfaceElevated,
                        child:  Icon(
                          Icons.movie_outlined,
                          color: AppColors.onSurfaceSubtle,
                        ),
                      ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.tittle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:  TextStyle(
                        color: AppColors.onSurface,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      children: [
                        MovieListTileBadge(label: movie.language),
                        MovieListTileBadge(label: movie.genre),
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (movie.rating != null && movie.rating! > 0)
                      Row(
                        children: [
                          const Icon(Icons.star_rounded,
                              color: Color(0xFFFFC107), size: 14),
                          const SizedBox(width: 4),
                          Text(
                            '${movie.rating}',
                            style: const TextStyle(
                              color: Color(0xFFFFC107),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MovieListTileActionButton(
                    icon: Icons.edit_outlined,
                    color: AppColors.accent,
                    onTap: onEdit,
                  ),
                  const SizedBox(height: 8),
                  MovieListTileActionButton(
                    icon: Icons.delete_outline_rounded,
                    color: const Color(0xFFE63946),
                    onTap: onDelete,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}