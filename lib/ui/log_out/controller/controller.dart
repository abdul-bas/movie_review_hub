import 'package:first_project/core/database/auth/log_out.dart';
import 'package:flutter/material.dart';


class LogOutController extends ChangeNotifier {
  LogOutController({required this.userId});

  final String userId;
  bool isLoggingOut = false;


  Future<bool> logout(BuildContext context) async {
    isLoggingOut = true;
    notifyListeners();

    try {
      await logOut(userId, context);
      return true;
    } catch (_) {
      return false;
    } finally {
      isLoggingOut = false;
      notifyListeners();
    }
  }
}