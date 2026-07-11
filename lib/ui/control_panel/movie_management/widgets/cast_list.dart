import 'dart:io';
import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CastList extends StatelessWidget {
  const CastList({
    super.key,
    required this.imagePaths,
    required this.names,
    required this.onRemove,
  });

  final List<String> imagePaths;
  final List<String> names;
  final ValueChanged<int> onRemove;

  @override
  Widget build(BuildContext context) {
    if (imagePaths.isEmpty) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: AppColors.space24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppColors.cardRadius),
          border: Border.all(color: AppColors.border),
        ),
        alignment: Alignment.center,
        child:  Text(
          'No cast members added yet',
          style: TextStyle(color: AppColors.onSurfaceSubtle, fontSize: 13),
        ),
      );
    }

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: imagePaths.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppColors.space8),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppColors.space12,
            vertical: AppColors.space8,
          ),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppColors.cardRadius),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: AppColors.avatarRing,
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.avatarFallback,
                  backgroundImage: FileImage(File(imagePaths[index])),
                ),
              ),
              const SizedBox(width: AppColors.space12),
              Expanded(
                child: Text(
                  names[index],
                  style:  TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onSurface,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () => onRemove(index),
                icon: const Icon(Icons.delete_outline,
                    color: AppColors.error, size: 22),
              ),
            ],
          ),
        );
      },
    );
  }
}
