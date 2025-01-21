import 'package:flutter/material.dart';
import 'package:review_hub/model/sign_up_model.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/account/account.dart';





class ProfileWidgetWidget extends StatelessWidget {
  const ProfileWidgetWidget({
    super.key,
    required this.currentModel,
  });

  final SignUpModel currentModel;

  @override
  Widget build(BuildContext context) {
     final screenSize = MediaQuery.sizeOf(context).height;
    return Column( mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProfileWidget(image: currentModel.image,),OverFlowWidget(screenSize: screenSize, text: currentModel.fullName,size: 20,bold: FontWeight.w700,),OverFlowWidget(screenSize: screenSize, text: currentModel.email)],
    );
  }
}
