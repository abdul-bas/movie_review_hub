
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/home/widgets/genre_widget.dart';
import 'package:flutter/material.dart';

class Horror extends StatelessWidget {
   const Horror({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    return GenreWidget(
      userId: userId,
      color: AppColors.error,
      genre: 'Horror',
      icon: Icons.psychology_rounded,
    );
  }
}

