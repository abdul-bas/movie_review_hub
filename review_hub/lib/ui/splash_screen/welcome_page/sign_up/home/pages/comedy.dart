import 'package:flutter/material.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/pages/horror.dart';



class Comedy extends StatelessWidget {
  const Comedy({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    return GenreWidget(
      userId: userId,
      genre: 'Comedy',
      icon: Icons.theater_comedy,
      color:const Color(0xFFFF7043),
    );
  }
}
