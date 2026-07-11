import 'dart:io';
import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, this.imagePath, this.onTap});

  final String? imagePath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [AppColors.accent, Color(0xFF7B5CF0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: CircleAvatar(
          radius: AppColors.avatarRadius,
          backgroundColor: AppColors.avatarRing,
          backgroundImage:
              imagePath != null ? FileImage(File(imagePath!)) : null,
          child: imagePath == null
              ?  Icon(
                  Icons.person_rounded,
                  size: 36,
                  color: AppColors.onSurfaceSubtle,
                )
              : null,
        ),
      ),
    );
  }
}
