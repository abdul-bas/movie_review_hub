
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/settings/controller/controller.dart';
import 'package:flutter/material.dart';

class SettingsLabelColumn extends StatelessWidget {
  const SettingsLabelColumn({super.key, required this.item});

  final SettingItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style:  TextStyle(
            color: AppColors.onSurface,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          item.description,
          style:  TextStyle(
            color: AppColors.onSurfaceSubtle,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
