import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextButtons extends StatelessWidget {
  const TextButtons({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        text,
        style:  TextStyle(
          color: AppColors.onSurfaceSubtle,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}