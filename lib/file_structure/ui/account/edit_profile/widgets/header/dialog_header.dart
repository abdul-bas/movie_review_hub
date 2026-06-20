
import 'package:first_project/file_structure/core/const/app_colors.dart';
import 'package:flutter/material.dart';

class DialogHeader extends StatelessWidget {
  const DialogHeader({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 12, 16),
      child: Row(
        children: [
          const Text(
            'Edit Profile',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppColors.onSurface,
              letterSpacing: 0.1,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onClose,
            icon:  Icon(
              Icons.close_rounded,
              color: AppColors.onSurfaceSubtle,
              size: 20,
            ),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.surfaceElevated,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(6),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}
