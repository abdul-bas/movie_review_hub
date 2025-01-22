
// ignore_for_file: file_names

import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/drawer/genre/depending/depending.dart';
import 'package:flutter/material.dart';



class ThrillerScreen extends StatelessWidget {
  const ThrillerScreen({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bagroundBlack,
        body: GenreDraweScreenWidget(
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
