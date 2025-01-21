import 'package:flutter/material.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/pages/horror.dart';


class Fantecy extends StatelessWidget {
  const Fantecy({super.key,required this.userId});
final String userId;
  @override
  Widget build(BuildContext context) {
    return GenreWidget(genre: 'Fantecy',icon: Icons.auto_awesome,color: const   Color(0xFFB9A0F6),userId: userId,);
    }
}