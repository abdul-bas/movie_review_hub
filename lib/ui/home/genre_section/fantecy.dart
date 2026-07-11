
import 'package:first_project/ui/home/widgets/genre_widget.dart';
import 'package:flutter/material.dart';



class Fantecy extends StatelessWidget {
  const Fantecy({super.key,required this.userId});
final String userId;
  @override
  Widget build(BuildContext context) {
    return GenreWidget(genre: 'Fantecy',icon: Icons.auto_awesome,color: const   Color(0xFFB9A0F6),userId: userId,);
    }
}