import 'package:flutter/material.dart';

class GenreConfig {
  const GenreConfig({
    required this.genre,
    required this.icon,
    required this.accentColor,
    required this.gradientColors,
  });

  final String genre;
  final IconData icon;
  final Color accentColor;

  
  final List<Color> gradientColors;
}


class GenreConfigs {
  GenreConfigs._();

  static const action = GenreConfig(
    genre: 'Action',
    icon: Icons.local_fire_department,
    accentColor: Color(0xFFFFD700),
    gradientColors: [
      Color(0xFF2D2D2D),
      Color(0xFF111111),
      Color(0xFF1E1E1E),
    ],
  );

  static const comedy = GenreConfig(
    genre: 'Comedy',
    icon: Icons.theater_comedy,
    accentColor: Color(0xFFFF6F61),
    gradientColors: [
      Color(0xFFFF9A9E),
      Color(0xFFFAD0C4),
      Color(0xFFFBC2EB),
    ],
  );

  static const fantasy = GenreConfig(
    genre: 'Fantasy',
    icon: Icons.auto_awesome,
    accentColor: Color(0xFFB9A0F6),
    gradientColors: [
      Color(0xFF4A148C),
      Color(0xFF1A237E), 
      Color(0xFF0D47A1), 
    ],
  );

  static const horror = GenreConfig(
    genre: 'Horror',
    icon: Icons.psychology_alt,
    accentColor: Color(0xFFBF0000),
    gradientColors: [
      Color(0xFF1A0000),
      Color(0xFF800000),
      Color(0xFF000000),
    ],
  );

  static const thriller = GenreConfig(
    genre: 'Thriller',
    icon: Icons.warning_amber_rounded,
    accentColor: Color(0xFFE63946),
    gradientColors: [
      Color(0xFF000000),
      Color(0xFF1A1A1A),
      Color(0xFF212121), 
    ],
  );
}