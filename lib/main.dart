
import 'package:first_project/core/theme/app_theme.dart';
import 'package:first_project/core/database/auth/sign_up_hive_initialisation.dart';
import 'package:first_project/ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initFunction();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDark,
      builder: (context, dark, child) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: dark ? ThemeMode.dark : ThemeMode.light,
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}