import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/depending_data/navigations.dart';
import 'package:first_project/file_structure/ui/common/icon_button.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/search/search.dart';
import 'package:first_project/widget/container_widget.dart';
import 'package:first_project/widget/text_widget.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget buildHomeAppBar(BuildContext context,
    {required String id,
    required bool isDrawerOpen,
    required GlobalKey<ScaffoldState> scaffoldKey}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: bagroundBlack,
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
        function: () => navigateFromTop(context, Search(userId: id)),
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
