import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/depending_data/navigations.dart';
import 'package:first_project/depending_data/snacbar.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/control_home.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/sign_up.dart';
import 'package:first_project/widget/container_widget.dart';
import 'package:first_project/widget/text_button_widget.dart';
import 'package:flutter/material.dart';



// ignore: must_be_immutable
class Validation extends StatelessWidget {
  Validation({super.key, required this.userId});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ContainerWidget(
          assetImage: 'assets/sign up.jpg',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final smallScreen = constraints.maxWidth < 600;
                    return ContainerWidget(
                      color: opendecityBlack,
                      height: smallScreen?0.5:09,
                      width: smallScreen?1:1,
                      paddingV:smallScreen?0.33:0.1,
                      paddingH: smallScreen?0.04:0.1,
                      radius: 7,
                      child: Material(
                          color: const Color.fromARGB(0, 0, 0, 0),
                          child: Form(
                            key: _globalKey,
                            child: Column(spacing: 20,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               
                                const ContainerWidget(
                                  assetImage:
                                      'assets/Screenshot_2024-12-28_142342-removebg-preview.png',
                                  height: 0.15,
                                  width: 0.35,
                                  imgBaground: BoxFit.contain,
                                  paddingV: 0,
                                ),
                                
                                SignUpTextFieldWidget(labelText:'name' ,labelColor: textBlack,
                                  hint: 'name',
                                  valdation: (value) => value.length < 6,
                                  textForValidatoin: 'You Are Note Admin',
                                  controller: _email,
                                ),
                                SignUpTextFieldWidget(labelColor: textBlack,labelText:'PassWord' ,
                                  hint: 'PassWord',
                                  valdation: (value) => value.length < 6,
                                  textForValidatoin:
                                      'Password must be at least 6 characters long',
                                  controller: _password,
                                ),
                                TextButtonWidget(
                                  text: 'Login to Admin Panel',
                                  validateFunction: () =>
                                      navigateFunction(context),
                                  formKey: _globalKey,
                                )
                              ],
                            ),
                          )),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  navigateFunction(BuildContext context) {
    final name = _email.text.trim();
    final password = _password.text.trim();
    if (name.isNotEmpty && password.isNotEmpty) {
      const adminName = 'Abdul Basith';
      const adminPassword = '123456';
      if (name == adminName && password == adminPassword) {
        navigateFromBottom(context, ControlHome(userId: userId));
        SnackBarFunction(
            context: context,
            text: 'Control Panel Succesfully unlocked',
            color: Colors.green);
      } else {
        SnackBarFunction(
            context: context,
            text: 'You are not an admin or credentials are incorrect!',
            color: red);
      }
    }
  }
}
