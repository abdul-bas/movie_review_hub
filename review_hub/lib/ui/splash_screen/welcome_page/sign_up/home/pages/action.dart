import 'package:flutter/material.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/pages/horror.dart';



class ActionScreen extends StatelessWidget {
  const ActionScreen({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return GenreWidget(
      userId: userId,
      genre: 'Action',
      icon: Icons.local_fire_department,
      color:const Color(0xFFFFD700),
    );
  }
}
