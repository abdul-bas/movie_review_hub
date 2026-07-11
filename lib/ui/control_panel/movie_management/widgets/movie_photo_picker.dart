import 'dart:io';

import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MoviePhotoPicker extends StatelessWidget {
  const MoviePhotoPicker({
    super.key,
    required this.imagePaths,
    required this.onAdd,
    required this.onRemove,
  });

  final List<String> imagePaths;
  final VoidCallback onAdd;
  final ValueChanged<int> onRemove;

  static const double _tileSize = 96;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppColors.space12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppColors.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: Wrap(
          spacing: AppColors.space12,
  runSpacing: AppColors.space12,
        children: [
          ...List.generate(imagePaths.length + 1, (index) {
          if (index == imagePaths.length) {
                return InkWell(
                  onTap: onAdd,
                  borderRadius: BorderRadius.circular(AppColors.fieldRadius),
                  child: Container(
                    width: MoviePhotoPicker._tileSize,
                    height: MoviePhotoPicker._tileSize,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceElevated,
                      borderRadius:
                          BorderRadius.circular(AppColors.fieldRadius),
                      border: Border.all(
                          color: AppColors.border, style: BorderStyle.solid),
                    ),
                    child:  Icon(Icons.add_photo_alternate_outlined,
                        color: AppColors.onSurfaceSubtle, size: 30),
                  ),
                );
              }
              return SizedBox(
                width: MoviePhotoPicker._tileSize,
                height: MoviePhotoPicker._tileSize,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppColors.fieldRadius),
                      child: Image.file(
                        File(imagePaths[index]),
                        width: MoviePhotoPicker._tileSize,
                        height: MoviePhotoPicker._tileSize,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: -6,
                      right: -6,
                      child: InkWell(
                        onTap: () => onRemove(index),
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            color: AppColors.error,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.close,
                              size: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
          },),
        
        ],
      ),
    );
  }
}
