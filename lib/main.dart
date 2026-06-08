import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/function/hive_functions/log_functions/sign_up_hive_initialisation.dart';
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
    return ValueListenableBuilder(
      valueListenable: isDark,
      // ignore: no_leading_underscores_for_local_identifiers
      builder: (context, _isDark, child) {
        // Set colors based on the current theme
        if (_isDark) {
          bagroundBlack = Colors.black;
          bagroundWeight = Colors.white;
          textWeight = Colors.white;
          textBlack = Colors.black;
          color = Colors.blue;
          colorR = Colors.red;
          blue = Colors.lightBlue;
          red = Colors.redAccent;
          // ignore: deprecated_member_use
          opacityBlue = Colors.lightBlue.withOpacity(0.5);
          // ignore: deprecated_member_use
          opacityRed = Colors.redAccent.withOpacity(0.5);
          // ignore: deprecated_member_use
          opendcityWhite = Colors.white70.withOpacity(0.55);
          // ignore: deprecated_member_use
          opendecityBlack = Colors.black.withOpacity(0.55);
        } else {
          bagroundBlack = Colors.white;
          bagroundWeight = Colors.black;
          textWeight = Colors.black;
          textBlack = Colors.white;
          color = Colors.red;
          colorR = Colors.blue;
          blue = Colors.redAccent;
          red = Colors.lightBlue;
          // ignore: deprecated_member_use
          opacityBlue = Colors.redAccent.withOpacity(0.5);
          // ignore: deprecated_member_use
          opacityRed = Colors.lightBlue.withOpacity(0.5);
          // ignore: deprecated_member_use
          opendcityWhite = Colors.black.withOpacity(0.55);
          // ignore: deprecated_member_use
          opendecityBlack = Colors.white.withOpacity(0.55);
        }

        return MaterialApp(
          theme: ThemeData.dark(),
          darkTheme: ThemeData.light(),
          themeMode: _isDark ? ThemeMode.light : ThemeMode.dark,
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

ValueNotifier<bool> isDark = ValueNotifier<bool>(true );
