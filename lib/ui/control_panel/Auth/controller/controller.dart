
import 'package:first_project/core/utils/snack_bar/snacbar.dart';
import 'package:first_project/ui/control_panel/admin_dashboard/control_home.dart';
import 'package:first_project/routes/push_replacement_bottom.dart';
import 'package:flutter/material.dart';


class AdminAuthController {
  static const _adminName = 'Abdul Basith';
  static const _adminPassword = '123456';

 
  String? validate(String name, String password) {
    if (name.isEmpty || password.isEmpty) {
      return 'Please fill in all fields';
    }
    if (name == _adminName && password == _adminPassword) return null;
    return 'Incorrect name or password';
  }

  void login(BuildContext context, String name, String password, String userId) {
    final error = validate(name, password);
    if (error != null) {
      snackBarFunction(context: context, text: error, color: Colors.red.shade700);
      return;
    }
    navigateFromBottom(context, ControlHomeScreen(userId: userId));
    snackBarFunction(
      context: context,
      text: 'Control panel unlocked',
      color: Colors.green,
    );
  }
}

