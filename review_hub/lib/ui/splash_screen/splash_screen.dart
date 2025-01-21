import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/model/sign_up_model.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/Welcome_Page.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/home_page.dart';
import 'package:review_hub/widget/container_widget.dart';
import 'package:review_hub/widget/text_widget.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: false);
    isSign();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String text = 'movie review hub'.toUpperCase();

    return Scaffold(
  backgroundColor: bagroundBlack,
  body: Center(
    child: AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 250,
            height: 250,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // All text (both front and back) will now be behind the image.

                // Text behind and in front of the image
                ...List.generate(text.length, (index) {
                  double baseAngle = (index - text.length / 2) * (pi / 10);
                  double animatedAngle =
                      baseAngle + (_controller.value * pi * 2);
                  return Transform.translate(
                    offset: Offset(
                      200 * sin(animatedAngle),
                      -100 * cos(animatedAngle),
                    ),
                    child: Opacity(opacity: 0.8,
                      child: TextWidget(
                        text: text[index],
                        color: textWeight,
                        size: index < text.length / 2 ? 40 : 50,
                        bold: FontWeight.bold,
                      ),
                    ),
                  );
                }),

                // Center image at the top
                const ContainerWidget(
                   // Adjust width if needed
                  assetImage:
                      'assets/Screenshot_2024-12-28_142342-removebg-preview.png',
                ),
              ],
            ),
          ),
        );
      },
    ),
  ),
);

  }

  Future<void> isSign() async {
    await Future.delayed(const Duration(seconds: 5));
    // ignore: no_leading_underscores_for_local_identifiers
    final _db = await Hive.openBox<SignUpModel>('signUp');
    // ignore: await_only_futures
    final isLog = await _db.values.any((e) => e.isLog == true);

    if (_db.isEmpty) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const WelcomePage()));
    } else if (isLog) {
      // ignore: await_only_futures
      final data =
          // ignore: await_only_futures
          await _db.values.firstWhere((element) => element.isLog == true);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => HomePage(
                    id: data.id!,
                  )),
          (route) => false);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const WelcomePage()));
    }
  }
}
