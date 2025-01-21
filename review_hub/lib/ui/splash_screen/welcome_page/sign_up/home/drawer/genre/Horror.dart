// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/genre/depending/depending.dart';

class HorrorScreen extends StatelessWidget {
  const HorrorScreen({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bagroundBlack,
        body: GenreDraweScreenWidget(
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
