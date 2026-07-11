import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/account/profile/widgets/header/profile_avatar.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.model});

  final SignUpModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
           ProfileAvatar(imagePath: model.image),
           SizedBox(height: 10,),
          Text(
            model.fullName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:  TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.onSurface,
              letterSpacing: 0.1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            model.email,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:  TextStyle(
              fontSize: 13,
              color: AppColors.onSurfaceSubtle,
            ),
          ),
        ],
      ),
    );
  }
}
