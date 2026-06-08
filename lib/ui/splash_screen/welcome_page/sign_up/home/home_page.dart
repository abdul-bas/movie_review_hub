// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';
import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/depending_data/home_list.dart';
import 'package:first_project/depending_data/navigations.dart';
import 'package:first_project/function/hive_functions/log_functions/get_user_db.dart';
import 'package:first_project/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/drawer/drawer.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/pages/action.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/pages/all.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/pages/comedy.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/pages/fantecy.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/pages/horror.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/pages/thriller.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/search/search.dart';
import 'package:first_project/widget/container_widget.dart';
import 'package:first_project/widget/text_button_widget.dart';
import 'package:first_project/widget/text_widget.dart';
import 'package:flutter/material.dart';



// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key, required this.id});
  final String id;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDrawerOpen = false;
  ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    getMovie();
    getUserData();
    List<dynamic> childNavigation = [
      Flexible(child: All(userId: id)),
      Flexible(
          child: Comedy(
        userId: id,
      )),
      Flexible(child: Horror(userId: id)),
      Flexible(child: Thriller(userId: id)),
      Flexible(child: Fantecy(userId: id)),
      Flexible(child: ActionScreen(userId: id))
    ];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: bagroundBlack,
        key: _scaffoldKey,
        endDrawer: DrawerWidget(
          id: id,
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: bagroundBlack,
          title: const Row(
            children: [
              ContainerWidget(
                assetImage:
                    'assets/Screenshot_2024-12-28_142342-removebg-preview.png',
                height: 0.1,
                width: 0.12,
                imgBaground: BoxFit.contain,
              ),
              TextWidget(
                text: 'Review Hub',
                bold: FontWeight.w700,
              )
            ],
          ),
          actions: [
            IconButtonWidget(
              icon: Icons.search,
              function: () => navigateFromTop(
                  context,
                  Search(
                    userId: id,
                  )),
            ),
            IconButtonWidget(
              icon: Icons.menu,
              function: () {
                if (isDrawerOpen) {
                  Navigator.of(context).pop();
                } else {
                  _scaffoldKey.currentState?.openEndDrawer();
                }
              },
            )
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: usersDetails,
          builder: (context, value, child) {
            return ValueListenableBuilder(
              valueListenable: currentIndex,
              builder: (context, value, child) => Column(
                children: [
                  SizedBox(
                    height: height * 0.048,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.01),
                            child: TextButtonWidget(
                              function: () {
                                currentIndex.value = index;
                                // ignore: invalid_use_of_visible_for_testing_member
                                currentIndex.notifyListeners();
                              },
                              size: 15,
                              text: home[index],
                              textColor:
                                  value == index ? textWeight : textWeight,
                              backgroundColor: value == index
                                  ? Colors.red[900]
                                  // ignore: deprecated_member_use
                                  : Colors.grey.withOpacity(0.2),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  childNavigation[currentIndex.value]
                ],
              ),
            );
          },
        ));
  }
}

class AnimatedContainerWidget extends StatelessWidget {
  const AnimatedContainerWidget(
      {super.key, this.child, this.img, this.height, this.width});
  final Widget? child;
  final String? img;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // ignore: unnecessary_null_in_if_null_operators
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        height: (height != null ? screenHeight * height! : null),
        width: (width != null ? screenWidth * width! : null),
        duration: const Duration(milliseconds: 300),
        // ignore: sort_child_properties_last
        child: child,
        decoration: BoxDecoration(
            image: img != null
                ? DecorationImage(image: FileImage(File(img!)))
                : null,
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.3), // Shadow color
                blurRadius: 10, // Blur effect
                offset: const Offset(0, 4), // Shadow position
              ),
            ],
            borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget(
      {super.key,
      required this.icon,
      this.function,
      this.size,
      this.color,
      this.backgroundColor});
  final IconData icon;
  final Function()? function;
  final double? size;
  final dynamic color;
  final dynamic backgroundColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(backgroundColor),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        onPressed: () {
          if (function != null) {
            function!();
          }
        },
        icon: Icon(
          icon,
          color: color ?? textWeight,
          size: size,
        ));
  }
}
