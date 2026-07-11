
import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyMoviesView extends StatelessWidget {
  const EmptyMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.movie_outlined,
              size: 52, color: AppColors.onSurfaceSubtle.withValues(alpha:  0.4)),
          const SizedBox(height: 16),
           Text(
            'No movies yet',
            style: TextStyle(
              color: AppColors.onSurface,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
           Text(
            'Tap the + button to add your first movie',
            style: TextStyle(
              color: AppColors.onSurfaceSubtle,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
