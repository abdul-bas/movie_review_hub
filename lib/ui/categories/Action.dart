import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/categories/widgets/categories_widget.dart';
import 'package:first_project/core/database/movie_oprations/get_movie.dart';
import 'package:flutter/material.dart';


class ActionPage extends StatelessWidget {
  const ActionPage({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:AppColors. bagroundBlack,
        body: CategoriesWidget(
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
