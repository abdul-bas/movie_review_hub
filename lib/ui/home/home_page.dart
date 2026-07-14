import 'package:first_project/core/constants/genre_navigation.dart';
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/home/widgets/app_bar.dart';
import 'package:first_project/ui/home/widgets/category_bar.dart';
import 'package:first_project/core/database/auth/get_user_db.dart';
import 'package:first_project/core/database/movie_oprations/get_movie.dart';
import 'package:first_project/ui/drawer/drawer.dart';
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

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.bagroundBlack,
      key: _scaffoldKey,
      endDrawer: DrawerWidget(id: id),
      appBar: buildHomeAppBar(context,
          id: id, isDrawerOpen: isDrawerOpen, scaffoldKey: _scaffoldKey),
      body: ValueListenableBuilder(
        valueListenable: usersDetails,
        builder: (context, value, child) {
          return ValueListenableBuilder(
            valueListenable: currentIndex,
            builder: (context, value, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3,
                ),
                buildHomeCategoryBar(context, value, width, height,
                    currentIndex: currentIndex),
                const SizedBox(height: 8),
                Expanded(child: childNavigation(id)[currentIndex.value]),
              ],
            ),
          );
        },
      ),
    );
  }
}
