import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/depending_data/snacbar.dart';
import 'package:first_project/function/hive_functions/log_functions/email_cheking.dart';
import 'package:first_project/function/hive_functions/log_functions/sign_up_add.dart';
import 'package:first_project/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:first_project/main.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:first_project/ui/splash_screen/welcome_page/Welcome_Page.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_in/sign_in.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/home_page.dart';
import 'package:first_project/widget/container_widget.dart';
import 'package:first_project/widget/text_button_widget.dart';
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
                    text: 'Sign In',textColor: constWeght,
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
                          color: isDark.value?Colors.black.withOpacity(0.25):Colors.white.withOpacity(0.25),
                          height: isSmallScreen ? 0.7 : 0.8,
                          width: isSmallScreen ? 0.9 : 0.9,
                          paddingV: isSmallScreen ? 0.0 : 0.0,
                          paddingH: isSmallScreen ? 0.01 : 0.01,
                          radius: 7,
                          child: Column(spacing: 25,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [const SizedBox(
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
                              labelText: 'Full Name', // Label for the field
  labelColor: textBlack, // Changed label color for Full Name to teal
  prifixIcon: Icons.person, // Prefix icon for Full Name
  prifixColor:textBlack,
                              ),
                              SignUpTextFieldWidget(
                                hint: 'Email',
                                labelText: 'Email', // Label for the field
  labelColor: textBlack, // Label color for Email
  prifixIcon: Icons.email, // Prefix icon for Email
  prifixColor: Colors.blue, 
                                controller: _email,
                                valdation: (value) => !RegExp(
                                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                    .hasMatch(value),
                                textForValidatoin: 'Enter a valid email',
                              ),
                              SignUpTextFieldWidget(
                                hint: 'PassWord',
                                labelText: 'Password', // Label for the field
  labelColor: Colors.grey, // Label color for Password
  prifixIcon: Icons.lock, // Prefix icon for Password
  prifixColor: Colors.grey,
                                valdation: (value) => value.length < 6,
                                textForValidatoin:
                                    'Password must be at least 6 characters long',
                                controller: _password,
                              ),
                              SignUpTextFieldWidget(
                                hint: 'Confirm PassWord',
                                 labelText: 'Confirm Password', // Label for the field
  labelColor: Colors.grey, // Label color for Confirm Password
  prifixIcon: Icons.lock, // Prefix icon for Confirm Password
  prifixColor: Colors.grey,
                                valdation: (value) => value != _password.text,
                                textForValidatoin: 'Passwords do not match',
                                controller: _confirmPassword,
                              ),
                              TextButtonWidget(
                                text: 'Sign Up',bold: FontWeight.w900,size: 20,textColor: constWeght,
                                validateFunction: () => signUpFunction(context),
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

  Future<void> signUpFunction(BuildContext context) async {
    final fullName = _fullName.text.trim();
    final password = _password.text.trim();
    final confirmPassword = _confirmPassword.text.trim();
    final email = _email.text.trim();
    if (fullName.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        email.isNotEmpty) {
      bool chek = await emailCheking(email);
      if (!chek) {
        final value = SignUpModel(
            fullName: fullName, password: password, email: email, isLog: true);
        addSignUp(value);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRoute(builder: (context) {
    return HomePage(id: value.id!);
  }),
  (Route<dynamic> route) => false, // This removes all previous routes
);
        SnackBarFunction(
            // ignore: use_build_context_synchronously
            context: context,
            text: 'Signup successful! Welcome to the app.',
            color: Colors.green);
      } else {
        SnackBarFunction(
            // ignore: use_build_context_synchronously
            context: context,
            text: 'This email is already registered. Please try logging in.',
            color: red);
      }
    }
  }
}

class SignUpTextFieldWidget extends StatelessWidget {
  const SignUpTextFieldWidget(
      {super.key,
      required this.hint,
      this.controller,
      this.valdation,
      this.textForValidatoin,
      this.prifixColor,
      this.prifixIcon,
      this.labelText,this.labelColor});
  final String hint;
  final dynamic controller;
  final IconData? prifixIcon;
  final dynamic prifixColor;
  final String? labelText;
  // ignore: prefer_typing_uninitialized_variables
  final valdation;
  final String? textForValidatoin;
  final dynamic labelColor;
  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller,
      hint: hint,
      filled: true,
      filledColor: textWeight,
      width: 0.70,
      height: 0.1,
      radius: 5,
      validation: (value) => valdation(value),
      textForValidatoin: textForValidatoin,textColor:textBlack,
    
      prefixicon: prifixIcon,
      iconColor: prifixColor,
      labelText: labelText,
      labelColor: labelColor,maxLine: 1,
    );
  }
}
