
import 'package:first_project/ui/account/profile/widgets/header/profile_card.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:flutter/material.dart';

class HeaderBackground extends StatelessWidget {
  const HeaderBackground({
    super.key,
    required this.model,
  });

  final SignUpModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(opacity: const AlwaysStoppedAnimation(0.2),
          'assets/Screenshot_2024-12-28_142342-removebg-preview.png',
          fit: BoxFit.cover,
        ),
      Positioned(
        child:Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              24,
              0,
              24,
              20,
            ),
            child: ProfileCard(
              model: model,
            ),
          ),
        ) ),
        
        
      ],
    );
  }
}
