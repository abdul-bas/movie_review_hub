
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/core/theme/app_theme.dart';
import 'package:first_project/ui/auth/sign_in/sign_in.dart';
import 'package:first_project/ui/auth/sign_up/sign_up.dart';
import 'package:first_project/ui/common/container_widget.dart';
import 'package:first_project/ui/common/custome_text_form_widget.dart';
import 'package:flutter/material.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mdqHeight = MediaQuery.of(context).size.height;
    final mdqWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ContainerWidget(
        assetImage: 'assets/baground img2.jpg',
        child: Center(
          child: Container(
            // ignore: deprecated_member_use
            color: isDark.value?AppColors.black.withOpacity(0.25):AppColors.weight.withOpacity(0.25),
            height: mdqHeight * 0.4,
            width: mdqWidth * 0.9,
            child: Column(spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const SizedBox(
                  height: 10,
                ),
                const ContainerWidget(
                  assetImage:
                      'assets/Screenshot_2024-12-28_142342-removebg-preview.png',
                  height: 0.15,
                  width: 0.3,
                  imgBaground: BoxFit.contain,
                  paddingV: 0,
                ),
               
                Flexible(
                  child: TextFormFieldWidget(
                  hintColor:AppColors. textBlack,
                    navigation: SignIn(),
                    readOnly: true,
                    hint: 'Sign In',
                    prefixicon: Icons.login,
                    radius: 5,
                    filled: true,
                    filledColor:AppColors. bagroundWeight,
                    iconColor: AppColors.blue,
                    width: 0.75,
                    height: 0.1,
                  ),
                ),
                Flexible(
                  child: TextFormFieldWidget(hintColor:AppColors. textBlack,
                  
                    navigation: SignUp(),
                    radius: 5,
                    readOnly: true,
                    hint: 'Sign Up',
                    prefixicon: Icons.person_add,
                    filled: true,
                    filledColor:AppColors. bagroundWeight,
                    iconColor:AppColors. textBlack,
                    width: 0.75,
                    height: 0.1,
                  ),
                ),
             const SizedBox(
                  height: 10,
                ), ],
            ),
          ),
        ),
      ),
    );
  }
}
