
  import 'package:first_project/model/sign_up_model.dart';
import 'package:first_project/ui/auth/welcome_screen/Welcome_Page.dart';
import 'package:first_project/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> isSign(BuildContext context) async {
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