// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/genre/depending/depending.dart';


class ActionPage extends StatelessWidget {
  const ActionPage({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bagroundBlack,
        body: GenreDraweScreenWidget(
            movieList: movieDetailes,
            userId: userId,
            genre: 'Action',
            gredientOne:const Color(0xFF2D2D2D),
            gredientThree:const Color(0xFF1E1E1E),
            // ignore: deprecated_member_use
            gredientTwo: Colors.black.withOpacity(0.9),
            icon: Icons.local_fire_department,
            color:const Color(0xFFFFD700)));
  }
}
