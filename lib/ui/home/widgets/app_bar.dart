import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/common/icon_button.dart';
import 'package:first_project/ui/search_screen/search_screen.dart';
import 'package:first_project/ui/common/container_widget.dart';
import 'package:first_project/ui/common/text_widget.dart';
import 'package:first_project/routes/top_push.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget buildHomeAppBar(BuildContext context,
    {required String id,
    required bool isDrawerOpen,
    required GlobalKey<ScaffoldState> scaffoldKey}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor:AppColors. bagroundBlack,
    elevation: 0,
    titleSpacing: 16,
    title: Row(
      children: [
        ContainerWidget(
          assetImage:
              'assets/Screenshot_2024-12-28_142342-removebg-preview.png',
          height: 0.1,
          width: 0.09,
          imgBaground: BoxFit.contain,
        ),
        const SizedBox(width: 8),
        const TextWidget(
          text: 'Review Hub',
          bold: FontWeight.w800,
        ),
      ],
    ),
    actions: [
      IconButtonWidget(
        icon: Icons.search_rounded,
        function: () => navigateFromTop(context, SearchScreen(userId: id)),
      ),
      const SizedBox(width: 4),
      IconButtonWidget(
        icon: Icons.menu_rounded,
        function: () {
          if (isDrawerOpen) {
            Navigator.of(context).pop();
          } else {
            scaffoldKey.currentState?.openEndDrawer();
          }
        },
      ),
      const SizedBox(width: 8),
    ],
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        height: 1,
        color: Colors.white.withValues(alpha: 0.06),
      ),
    ),
  );
}
