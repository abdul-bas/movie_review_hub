
import 'package:first_project/core/database/auth/sign_up_add.dart';
import 'package:first_project/core/database/auth/singn_in.dart';
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/core/utils/snack_bar/snacbar.dart';
import 'package:first_project/ui/home/home_page.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class AuthController {
  static Future<void> signUpFunction(
  BuildContext context,
  TextEditingController fullName,
  TextEditingController password,
  TextEditingController confirmPassword,
  TextEditingController email,
) async {
  final fullNameText = fullName.text.trim();
  final passwordText = password.text.trim();
  final confirmPasswordText = confirmPassword.text.trim();
  final emailText = email.text.trim();

  if (fullNameText.isEmpty ||
      passwordText.isEmpty ||
      confirmPasswordText.isEmpty ||
      emailText.isEmpty) {
    return;
  }

  final emailExists = await _emailChecking(emailText);

  if (!context.mounted) return;

  if (emailExists) {
    snackBarFunction(
      context: context,
      text: 'This email is already registered. Please try logging in.',
      color: AppColors.red,
    );
    return;
  }

  final value = SignUpModel(
    fullName: fullNameText,
    password: passwordText,
    email: emailText,
    isLog: true,
  );

  await addSignUp(value);

  if (!context.mounted) return;

  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (_) => HomePage(id: value.id!),
    ),
    (route) => false,
  );

  snackBarFunction(
    context: context,
    text: 'Signup successful! Welcome to the app.',
    color: Colors.green,
  );
}

static Future<bool> _emailChecking(String email) async {
  final db = await Hive.openBox<SignUpModel>('signUp');

  return db.values.any(
    (user) => user.email.toLowerCase() == email.toLowerCase(),
  );
}
static void signInFunction(
  BuildContext context,
  String email,
  String password,
) {
  if (email.trim().isEmpty || password.trim().isEmpty) {
    snackBarFunction(
      context: context,
      text: 'Please enter a valid email and password',
      color: AppColors.red,
    );
    return;
  }

  signIn(
    
    email.trim(),
    password.trim(),context
  );
}
}