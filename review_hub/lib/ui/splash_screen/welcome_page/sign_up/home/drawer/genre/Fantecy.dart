// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/genre/depending/depending.dart';

class FantecyScreen extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  FantecyScreen({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bagroundBlack,
        body: GenreDraweScreenWidget(
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
