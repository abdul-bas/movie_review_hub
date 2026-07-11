
import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Expanded(child: Divider(color: AppColors.divider)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            label,
            style:  TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.onSurfaceSubtle,
              letterSpacing: 1.4,
            ),
          ),
        ),
         Expanded(child: Divider(color: AppColors.divider)),
      ],
    );
  }
}