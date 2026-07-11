// ignore_for_file: file_names
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/categories/widgets/categories_widget.dart';
import 'package:first_project/core/database/movie_oprations/get_movie.dart';
import 'package:flutter/material.dart';


class FantecyScreen extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  FantecyScreen({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:AppColors. bagroundBlack,
        body: CategoriesWidget(
            userId: userId,
            genre: 'Fantecy',
            gredientOne: Colors.purple.shade900,
            gredientThree: Colors.blue.shade900,
            gredientTwo: Colors.indigo.shade900,
            icon: Icons.auto_awesome,
            color:const Color(0xFFB9A0F6),
            movieList: movieDetailes));
  }
}
