// ignore_for_file: file_names
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/categories/widgets/categories_widget.dart';
import 'package:first_project/core/database/movie_oprations/get_movie.dart';
import 'package:flutter/material.dart';

class HorrorScreen extends StatelessWidget {
  const HorrorScreen({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:AppColors. bagroundBlack,
        body: CategoriesWidget(
            userId: userId,
            genre: 'Horror',
            gredientOne: const Color(0xFF1A0000),
            gredientThree: const Color(0xFF000000),
            // ignore: deprecated_member_use
            gredientTwo: const Color(0xFF800000).withOpacity(0.7),
            icon: Icons.psychology_alt,
            color: const Color(0xFFBF0000),
            movieList: movieDetailes));
  }
}
