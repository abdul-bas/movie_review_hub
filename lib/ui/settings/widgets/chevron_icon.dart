
import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsChevronIcon extends StatelessWidget {
  const SettingsChevronIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return  Icon(
      Icons.arrow_forward_ios_rounded,
      color: AppColors.onSurfaceSubtle,
      size: 15,
    );
  }
}