
import 'package:first_project/file_structure/core/const/app_colors.dart';
import 'package:flutter/material.dart';

class DrawerSectionLabel extends StatelessWidget {
  const DrawerSectionLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: AppColors.onSurfaceSubtle,
          letterSpacing: 1.4,
        ),
      ),
    );
  }
}