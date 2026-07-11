
import 'package:flutter/material.dart';

class MovieListTileActionButton extends StatelessWidget {
  const MovieListTileActionButton({super.key, 
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: color.withValues(alpha:  0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha:  0.25)),
        ),
        child: Icon(icon, color: color, size: 16),
      ),
    );
  }
}