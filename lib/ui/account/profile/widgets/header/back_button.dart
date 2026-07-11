
import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileBackButton extends StatelessWidget {
  const ProfileBackButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child:  Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.arrow_back_rounded,
              color: AppColors.onSurface,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}