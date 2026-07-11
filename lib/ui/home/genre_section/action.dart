
import 'package:first_project/ui/home/widgets/genre_widget.dart';
import 'package:flutter/material.dart';

class ActionScreen extends StatelessWidget {
  const ActionScreen({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return GenreWidget(
      userId: userId,
      genre: 'Action',
      icon: Icons.local_fire_department,
      color: const Color(0xFFFFD700),
    );
  }
}
