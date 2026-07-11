
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/core/theme/app_theme.dart';
import 'package:first_project/ui/auth/controller/auth_controller.dart';
import 'package:first_project/ui/auth/sign_up/sign_up.dart';
import 'package:first_project/ui/common/container_widget.dart';
import 'package:first_project/ui/common/sign_up_text_field_widget.dart';
import 'package:first_project/ui/common/text_button_widget.dart';
import 'package:flutter/material.dart';


class SignIn extends StatelessWidget {
  SignIn({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Center(
          child: ContainerWidget(
            assetImage: 'assets/sign up.jpg',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SafeArea(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextButtonWidget(
                      text: 'Sign up',textColor:AppColors. constWeght,
                      navigation: SignUp(),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Center(
                  
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final containerHeight = isSmallScreen
                            ? screenSize.height * 0.6
                            : screenSize.height * 0.8;
                        final containerWidth = isSmallScreen
                            ? screenSize.width * 0.9
                            : screenSize.width * 0.5;

                        return ContainerWidget(
                          // ignore: sort_child_properties_last
                          child: Material(
                            color: Colors.transparent,
                            child: Form(
                              key: _globalKey,
                              child: Column(
                                spacing: 25,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: ContainerWidget(
                                      assetImage:
                                          'assets/Screenshot_2024-12-28_142342-removebg-preview.png',
                                      height: containerHeight * 0.1,
                                      width: containerWidth * 0.4,
                                      imgBaground: BoxFit.contain,
                                      paddingV: 0,
                                    ),
                                  ),
                                  Flexible(
                                    child: SignUpTextFieldWidget(

                                      hint: 'Email',prifixIcon: Icons.email,labelText: 'Email',labelColor:AppColors. textBlack,  
                                      valdation: (value) => !RegExp(
                                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                          .hasMatch(value),
                                      textForValidatoin:
                                          'Enter a valid email',
                                      controller: _email,prifixColor: Colors.blue,
                                    ),
                                  ),
                                  Flexible(
                                    child: SignUpTextFieldWidget(
                                      hint: 'Password',prifixIcon: Icons.lock,prifixColor:  Colors.grey,
                                      valdation: (value) => value.length < 6,labelText:'Password' ,labelColor: Colors.grey,
                                      textForValidatoin:
                                          'Password must be at least 6 characters long',
                                      controller: _password,
                                    ),
                                  ),
                                  Flexible(
                                    child: TextButtonWidget(
                                      text: 'Sign In',bold: FontWeight.w900,size: 20,textColor:AppColors. constWeght,
                                      validateFunction: () =>
                                         AuthController. signInFunction(context,_email.text,_password.text),
                                      formKey: _globalKey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // ignore: deprecated_member_use
                          color: isDark.value?Colors.black.withOpacity(0.25):Colors.white.withOpacity(0.25),
                          height: containerHeight,
                          width: containerWidth,
                          paddingV: isSmallScreen ? 0.4 : 0.05,
                          paddingH: isSmallScreen ? 0.03 : 0.05,
                          radius: 10,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
