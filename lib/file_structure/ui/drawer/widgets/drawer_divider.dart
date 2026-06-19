
import 'package:first_project/file_structure/core/const/app_colors.dart';
import 'package:flutter/material.dart';

class DrawerDivider extends StatelessWidget {
  const DrawerDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.divider,
      height: 1,
      indent: 16,
      endIndent: 16,
    );
  }
}