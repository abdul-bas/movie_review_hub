import 'package:flutter/material.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/pages/horror.dart';


class Thriller extends StatelessWidget {
  const Thriller({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return GenreWidget(
        userId: userId,
        genre: 'Thriller',
        icon: Icons.movie_filter,
        color:const Color(0xFFE63946));
  }
}
