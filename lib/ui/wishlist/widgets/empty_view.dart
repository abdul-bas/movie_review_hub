
import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyFavoritesView extends StatelessWidget {
  const EmptyFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              color: AppColors.surface,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.border, width: 1.5),
            ),
            child:  Icon(
              Icons.favorite_border_rounded,
              size: 36,
              color: AppColors.onSurfaceSubtle,
            ),
          ),
          const SizedBox(height: 20),
           Text(
            'No favorites yet',
            style: TextStyle(
              color: AppColors.onSurface,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 8),
           Text(
            'Movies you heart will appear here',
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
