// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/genre/depending/depending.dart';


class ComedyScreen extends StatelessWidget {
  const ComedyScreen({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bagroundBlack,
        body: GenreDraweScreenWidget(
          movieList: movieDetailes,
          userId: userId,
          icon: Icons.theater_comedy,
          color:const Color(0xFFff6f61),
          gredientOne:const Color(0xFFff9a9e),
          gredientTwo:const Color(0xFFfad0c4),
          // ignore: deprecated_member_use
          gredientThree:const Color(0xFFfbc2eb).withOpacity(0.7),
          genre: 'Comedy',
        ));
  }
}
