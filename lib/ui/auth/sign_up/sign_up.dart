import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/core/theme/app_theme.dart';
import 'package:first_project/core/database/movie_oprations/get_movie.dart';
import 'package:first_project/ui/auth/controller/auth_controller.dart';
import 'package:first_project/ui/common/sign_up_text_field_widget.dart';
import 'package:first_project/ui/auth/sign_in/sign_in.dart';
import 'package:first_project/ui/common/container_widget.dart';
import 'package:first_project/ui/common/text_button_widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    getMovie();
    // ignore: unused_local_variable
    final screenSize = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      body: SingleChildScrollView(
        child: ContainerWidget(
          assetImage: 'assets/signup.jpg',
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SafeArea(
                  child: TextButtonWidget(
                    text: 'Sign In',
                    textColor: AppColors.constWeght,
                    navigation: SignIn(),
                  ),
                ),
                Flexible(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isSmallScreen = constraints.maxWidth < 600;
                      return Center(
                        child: ContainerWidget(
                          // ignore: deprecated_member_use
                          color: isDark.value
                              ? Colors.black.withOpacity(0.25)
                              : Colors.white.withOpacity(0.25),
                          height: isSmallScreen ? 0.7 : 0.8,
                          width: isSmallScreen ? 0.9 : 0.9,
                          paddingV: isSmallScreen ? 0.0 : 0.0,
                          paddingH: isSmallScreen ? 0.01 : 0.01,
                          radius: 7,
                          child: Column(
                            spacing: 25,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Flexible(
                                child: ContainerWidget(
                                  assetImage:
                                      'assets/Screenshot_2024-12-28_142342-removebg-preview.png',
                                  height: isSmallScreen ? 0.15 : 0.15,
                                  width: isSmallScreen ? 0.3 : 0.3,
                                  imgBaground: BoxFit.contain,
                                  paddingV: 0.02,
                                ),
                              ),
                              SignUpTextFieldWidget(
                                hint: 'Full Name',
                                valdation: (value) => value.length < 3,
                                textForValidatoin:
                                    'Full Name must be at least 3 characters long',
                                controller: _fullName,
                                labelText: 'Full Name',
                                labelColor: AppColors.textBlack,
                                prifixIcon: Icons.person,
                                prifixColor: AppColors.textBlack,
                              ),
                              SignUpTextFieldWidget(
                                hint: 'Email',
                                labelText: 'Email',
                                labelColor: AppColors.textBlack,
                                prifixIcon: Icons.email,
                                prifixColor: AppColors.blue,
                                controller: _email,
                                valdation: (value) => !RegExp(
                                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                    .hasMatch(value),
                                textForValidatoin: 'Enter a valid email',
                              ),
                              SignUpTextFieldWidget(
                                hint: 'PassWord',
                                labelText: 'Password',
                                labelColor: Colors.grey,
                                prifixIcon: Icons.lock,
                                prifixColor: Colors.grey,
                                valdation: (value) => value.length < 6,
                                textForValidatoin:
                                    'Password must be at least 6 characters long',
                                controller: _password,
                              ),
                              SignUpTextFieldWidget(
                                hint: 'Confirm PassWord',
                                labelText: 'Confirm Password',
                                labelColor: Colors.grey,
                                prifixIcon: Icons.lock,
                                prifixColor: Colors.grey,
                                valdation: (value) => value != _password.text,
                                textForValidatoin: 'Passwords do not match',
                                controller: _confirmPassword,
                              ),
                              TextButtonWidget(
                                text: 'Sign Up',
                                bold: FontWeight.w900,
                                size: 20,
                                textColor: AppColors.constWeght,
                                validateFunction: () =>AuthController. signUpFunction(context,_fullName,_password,_confirmPassword,_email),
                                formKey: _globalKey,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
