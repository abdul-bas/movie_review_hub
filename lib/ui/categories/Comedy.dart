// ignore_for_file: file_names
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/categories/widgets/categories_widget.dart';
import 'package:first_project/core/database/movie_oprations/get_movie.dart';

import 'package:flutter/material.dart';



class ComedyScreen extends StatelessWidget {
  const ComedyScreen({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:AppColors. bagroundBlack,
        body: CategoriesWidget(
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
