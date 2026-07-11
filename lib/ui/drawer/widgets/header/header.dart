import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/drawer/widgets/header/user_avatar.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:flutter/material.dart';

class DrawerHeaderSection extends StatelessWidget {
  const DrawerHeaderSection({super.key, required this.user});

  final SignUpModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Align(alignment: AlignmentGeometry.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserAvatar(imagePath: user.image),
            const SizedBox(height: 10),
            Text(
              user.fullName ,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.onSurface,
                letterSpacing: 0.1,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              user.email ,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColors.onSurfaceSubtle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
