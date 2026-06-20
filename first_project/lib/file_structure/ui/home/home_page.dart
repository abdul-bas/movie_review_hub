import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/file_structure/ui/home/widgets/app_bar.dart';
import 'package:first_project/file_structure/ui/home/widgets/category_bar.dart';
import 'package:first_project/function/hive_functions/log_functions/get_user_db.dart';
import 'package:first_project/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:first_project/file_structure/ui/drawer/drawer.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/pages/action.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/pages/all.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/pages/comedy.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/pages/fantecy.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/pages/horror.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/pages/thriller.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key, required this.id});
  final String id;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
 final bool isDrawerOpen = false;
 final ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    getMovie();
    getUserData();

    List<dynamic> childNavigation = [
      Flexible(child: All(userId: id)),
      Flexible(child: Comedy(userId: id)),
      Flexible(child: Horror(userId: id)),
      Flexible(child: Thriller(userId: id)),
      Flexible(child: Fantecy(userId: id)),
      Flexible(child: ActionScreen(userId: id)),
    ];

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bagroundBlack,
      key: _scaffoldKey,
      endDrawer: DrawerWidget(id: id),
      appBar: buildHomeAppBar(context,id: id,isDrawerOpen: isDrawerOpen,scaffoldKey: _scaffoldKey),
      body: ValueListenableBuilder(
        valueListenable: usersDetails,
        builder: (context, value, child) {
          return ValueListenableBuilder(
            valueListenable: currentIndex,
            builder: (context, value, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHomeCategoryBar(context, value, width, height,currentIndex: currentIndex
               ),
                const SizedBox(height: 8),
                Expanded(child: childNavigation[currentIndex.value]),
              ],
            ),
          );
        },
      ),
    );
  }


}

