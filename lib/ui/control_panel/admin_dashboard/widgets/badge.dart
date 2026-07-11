
import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MovieListTileBadge extends StatelessWidget {
  const MovieListTileBadge({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        label,
        style:  TextStyle(
          color: AppColors.onSurfaceSubtle,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}