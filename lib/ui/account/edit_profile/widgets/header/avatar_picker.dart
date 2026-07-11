import 'dart:io';

import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AvatarPicker extends StatelessWidget {
  const AvatarPicker({super.key, this.imagePath, required this.onTap});

  final String? imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF4F6EF7), Color(0xFF7B5CF0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: CircleAvatar(
              radius: 46,
              backgroundColor: const Color(0xFF2E3240),
              backgroundImage:
                  imagePath != null ? FileImage(File(imagePath!)) : null,
              child: imagePath == null
                  ?  Icon(
                      Icons.person_rounded,
                      size: 38,
                      color: AppColors.onSurfaceSubtle,
                    )
                  : null,
            ),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.surface,
                width: 2.5,
              ),
            ),
            child: const Icon(
              Icons.camera_alt_rounded,
              size: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
