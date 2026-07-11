

import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsIconBadge extends StatelessWidget {
  const SettingsIconBadge({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Icon(icon, color: AppColors.accent, size: 22),
    );
  }
}