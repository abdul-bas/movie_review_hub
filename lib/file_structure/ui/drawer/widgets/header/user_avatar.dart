
import 'dart:io';

import 'package:first_project/file_structure/core/const/app_colors.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, this.imagePath, this.onTap});

  final String? imagePath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: AppColors.avatarFallback,
        backgroundImage:
            imagePath != null ? FileImage(File(imagePath!)) : null,
        child: imagePath == null
            ? const Icon(
                Icons.person_rounded,
                size: 30,
                color: AppColors.avatarIcon,
              )
            : null,
      ),
    );
  }
}