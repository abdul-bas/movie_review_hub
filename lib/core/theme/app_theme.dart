import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
ValueNotifier<bool> isDark = ValueNotifier<bool>(true);

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      canvasColor: AppColors.background,
      primaryColor: AppColors.accent,
      dividerColor: AppColors.divider,
      colorScheme: ColorScheme.dark(
        primary: AppColors.accent,
        secondary: AppColors.inputFocusedBorder,
        surface: AppColors.surface,
        error: AppColors.error,
        onPrimary: AppColors.onSurface,
        onSurface: AppColors.onSurface,
        onError: AppColors.onSurface,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.onSurface,
        elevation: 0,
        centerTitle: false,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppColors.onSurface),
        bodyMedium: TextStyle(color: AppColors.onSurface),
        bodySmall: TextStyle(color: AppColors.onSurfaceSubtle),
        titleLarge:
            TextStyle(color: AppColors.onSurface, fontWeight: FontWeight.w700),
      ),
      iconTheme: IconThemeData(color: AppColors.onSurface),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.inputFill,
        hintStyle: TextStyle(color: AppColors.onSurfaceSubtle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppColors.fieldRadius),
          borderSide: BorderSide(color: AppColors.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppColors.fieldRadius),
          borderSide:
              const BorderSide(color: AppColors.inputFocusedBorder, width: 1.5),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceElevated,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppColors.cardRadius),
          side: BorderSide(color: AppColors.border),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.onSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppColors.fieldRadius),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.surfaceElevated,
        contentTextStyle: TextStyle(color: AppColors.onSurface),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.white,
      primaryColor: AppColors.accent,
      dividerColor: const Color(0xFFE0E0E5),
      colorScheme: ColorScheme.light(
        primary: AppColors.accent,
        secondary: AppColors.inputFocusedBorder,
        surface: Colors.white,
        error: AppColors.error,
        onPrimary: Colors.white,
        onSurface: const Color(0xFF14141C),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF14141C),
        elevation: 0,
        centerTitle: false,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFF14141C)),
        bodyMedium: TextStyle(color: Color(0xFF14141C)),
        bodySmall: TextStyle(color: Color(0xFF8B8B9A)),
        titleLarge:
            TextStyle(color: Color(0xFF14141C), fontWeight: FontWeight.w700),
      ),
      iconTheme: const IconThemeData(color: Color(0xFF14141C)),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF2F2F5),
        hintStyle: const TextStyle(color: Color(0xFF8B8B9A)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppColors.fieldRadius),
          borderSide: const BorderSide(color: Color(0xFFE0E0E5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppColors.fieldRadius),
          borderSide:
              const BorderSide(color: AppColors.inputFocusedBorder, width: 1.5),
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppColors.cardRadius),
          side: const BorderSide(color: Color(0xFFE0E0E5)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppColors.fieldRadius),
          ),
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color(0xFF14141C),
        contentTextStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}