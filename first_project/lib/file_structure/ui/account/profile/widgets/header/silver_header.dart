
import 'package:first_project/file_structure/core/const/app_colors.dart';
import 'package:first_project/file_structure/ui/account/profile/widgets/header/back_button.dart';
import 'package:first_project/file_structure/ui/account/profile/widgets/header/background.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:flutter/material.dart';

class AccountSliverHeader extends StatelessWidget {
  const AccountSliverHeader({super.key, 
    required this.model,
    required this.onBack,
  });

  final SignUpModel model;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final double expandedHeight =
        MediaQuery.sizeOf(context).height * 0.38;

    return SliverAppBar(
      expandedHeight: expandedHeight,
      pinned: true,
      backgroundColor: AppColors.background,
      leading: ProfileBackButton(onTap: onBack),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        
        background: HeaderBackground(model: model),
      ),
    );
  }
}