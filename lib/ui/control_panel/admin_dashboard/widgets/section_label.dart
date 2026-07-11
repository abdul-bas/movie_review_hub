
import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DashboardSectionLabel extends StatelessWidget {
  const  DashboardSectionLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(
        color: AppColors.onSurface,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.2,
      ),
    );
  }
}
