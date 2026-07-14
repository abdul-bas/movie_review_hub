import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/common/icon_button.dart';
import 'package:first_project/ui/search_screen/search_screen.dart';

import 'package:first_project/routes/top_push.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget buildHomeAppBar(BuildContext context,
    {required String id,
    required bool isDrawerOpen,
    required GlobalKey<ScaffoldState> scaffoldKey}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.bagroundBlack,
    flexibleSpace: SafeArea(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
            child: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(
                    'assets/Screenshot_2024-12-28_142342-removebg-preview.png')),
          ),
          Text(
            'Review Hub',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
        ],
      ),
    ),
    actions: [
      IconButtonWidget(
        icon: Icons.search_rounded,
        function: () => navigateFromTop(context, SearchScreen(userId: id)),
      ),
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
  );
}
