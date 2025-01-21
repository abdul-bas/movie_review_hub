import 'package:flutter/material.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/depending_data/snacbar.dart';
import 'package:review_hub/function/hive_functions/log_functions/log_out.dart';
import 'package:review_hub/function/pop_up.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/text_button_icon.dart';
import 'package:review_hub/widget/text_button_widget.dart';
import 'package:review_hub/widget/text_widget.dart';


class LogOut extends StatelessWidget {
  const LogOut({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: bagroundBlack,
      title:  TextButtonIconWidget(
        label: 'Log Out',
        icon: Icons.logout,
        color: Colors.red[900],
      ),
      content: const TextWidget(
        text: 'Are you sure you want to logout?',
        size: 20,
      ),
      actions: [
        TextButtonWidget(
          text: 'Cancel',
          function: () => popUp(context),
        ),
        TextButtonWidget(
            text: 'Logout',
            backgroundColor: Colors.red.shade800,
            function: () {
              logOut(id, context);
              SnackBarFunction(
                  context: context,
                  text: 'You have been logged out successfully.',
                  color: Colors.red.shade900);
            })
      ],
    );
  }
}
