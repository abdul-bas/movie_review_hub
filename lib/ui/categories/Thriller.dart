
// ignore_for_file: file_names
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/categories/widgets/categories_widget.dart';
import 'package:first_project/core/database/movie_oprations/get_movie.dart';
import 'package:flutter/material.dart';



class ThrillerScreen extends StatelessWidget {
  const ThrillerScreen({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:AppColors. bagroundBlack,
        body: CategoriesWidget(
            userId: userId,
            genre: 'Thriller',
            gredientOne: Colors.black,
            gredientThree: Colors.grey[900]!,
            gredientTwo:const Color(0xFF1A1A1A),
            icon: Icons.warning_amber_rounded,
            color:const Color(0xFFE63946),
            movieList: movieDetailes));
  }
}
