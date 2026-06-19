import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/depending_data/navigations.dart';
import 'package:first_project/file_structure/ui/common/icon_button.dart';
import 'package:first_project/function/hive_functions/log_functions/get_user_db.dart';
import 'package:first_project/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:first_project/function/pop_up.dart';
import 'package:first_project/main.dart';
import 'package:first_project/file_structure/ui/auth/welcome_screen/Welcome_Page.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/delete/delete_movie.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/edit/movie_edit.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/movies_adding_page.dart';
import 'package:first_project/file_structure/ui/home/home_page.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/pages/movie_deteals/movie_deteals.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/search/search.dart';
import 'package:first_project/widget/container_widget.dart';
import 'package:first_project/widget/text_widget.dart';
import 'package:flutter/material.dart';



// ignore: must_be_immutable
class ControlHome extends StatelessWidget {
  ControlHome({super.key, required this.userId});
  final String userId;
  ValueNotifier<Offset> buttonPosition = ValueNotifier(const Offset(150, 150));
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.height;
    buttonPosition.value = const Offset(270, 450);
    return Scaffold(
        backgroundColor: bagroundBlack,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isSmallScreen = constraints.maxWidth < 500;
            if (isSmallScreen) {
              buttonPosition.value = const Offset(170, 750);
            }
            return Stack(children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final isSmallScreen = constraints.maxWidth < 500;

                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        leading: IconButtonWidget(
                          icon: Icons.arrow_back,
                          function: () => popUp(context),
                        ),
                        title: const TextWidget(
                          text: 'Admin Control Panel',
                          bold: FontWeight.w800,
                          size: 26,
                        ),
                        backgroundColor: bagroundBlack,
                        expandedHeight: isSmallScreen
                            ? screenSize * 0.23
                            : screenSize * 0.3,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Stack(children: [
                            // ignore: sort_child_properties_last
                            ContainerWidget(
                              radius: 15,
                              gredient1: true,
                              alignment: Alignment.lerp(Alignment.center,
                                  Alignment.bottomCenter, screenSize * 0.0009),
                              color: red,
                              child: TextFormFieldWidget(
                                navigation: Search(userId: userId),
                                readOnly: true,
                                filled: true,
                                filledColor: textWeight,
                                paddingH: screenSize * 0.00007,
                                radius: 25,
                                prefixicon: Icons.search,
                                hint: 'Search',
                              ),
                            ),
                          ]),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: 'Dashboard Overview',
                              bold: FontWeight.w600,
                              size: screenSize * 0.02,
                              paddingH: 0.01,
                              paddingV: 0.01,
                            ),
                            ValueListenableBuilder(
                              valueListenable: usersDetails,
                              builder: (context, user, child) {
                                // ignore: unused_local_variable
                                final userModel = user.firstWhere(
                                  (element) => element.id == userId,
                                );
                                return ValueListenableBuilder(
                                  valueListenable: movieDetailes,
                                  builder: (context, movie, child) {
                                    return Column(
                                      spacing: 15,
                                      children: [
                                        Row(
                                          children: [
                                            CardWidget(
                                                screenSize: screenSize,
                                                count: '${movie.length}',
                                                icon: Icons.movie_creation,
                                                item: 'Total Movies',
                                                value: true),
                                            CardWidget(
                                                screenSize: screenSize,
                                                count: '${user.length}',
                                                icon: Icons.people_alt_rounded,
                                                item: 'Active Users',
                                                value: true),
                                          ],
                                        ),

                                        
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              text: 'Movies Library',
                                              bold: FontWeight.w600,
                                              size: screenSize * 0.02,
                                              paddingH: 0.01,
                                            ),if(movie.isEmpty)Container(height: screenSize*0.45,alignment: Alignment.center,
                                              child: TextWidget(text: '"Oops! No Movies Found. Add Some!"'.toUpperCase(),bold: FontWeight.w800,),),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            ...List.generate(movie.length,
                                                (index) {
                                              final model = movie[index];
                                              
                                              return Column(
                                                children: [
                                                  ContainerWidget(
                                                    onTap: () =>
                                                        navigateFromCenter(
                                                            context: context,
                                                            navigation:
                                                                MovieDeteals(
                                                              id: model.id!,
                                                              userId: userId,
                                                              url: model.link,
                                                            )),
                                                    height: 0.14,
                                                    // ignore: deprecated_member_use
                                                    color: Colors.grey
                                                        // ignore: deprecated_member_use
                                                        .withOpacity(0.1),
                                                    paddingH: 0.02,
                                                    radius: 10,
                                                    child: Row(
                                                      children: [
                                                        // Movie Image
                                                        ContainerWidget(
                                                          fileImage: model
                                                              .movieImages[0],
                                                          width: 0.2,
                                                          paddingV: 0.02,
                                                          paddingH: 0.01,
                                                          radius: 10,
                                                        ),

                                                        // Movie Details
                                                        Expanded(
                                                          flex: 3,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                // Movie Title
                                                                Text(
                                                                  model.tittle,
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color:
                                                                          textWeight),
                                                                ),

                                                                const SizedBox(
                                                                    height: 10),

                                                                Row(
                                                                  children: [
                                                                    ContainerWidget(
                                                                      // ignore: sort_child_properties_last
                                                                      child:
                                                                          FittedBox(
                                                                        fit: BoxFit
                                                                            .scaleDown,
                                                                        child:
                                                                            TextWidget(
                                                                          text:
                                                                              model.language,
                                                                        ),
                                                                      ),
                                                                      width:
                                                                          0.15,
                                                                      height:
                                                                          0.03,
                                                                      border:
                                                                          true,
                                                                      borderColor:
                                                                          opendcityWhite,
                                                                      radius: 5,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            5),
                                                                    ContainerWidget(
                                                                      height:
                                                                          0.03,
                                                                      width:
                                                                          0.15,
                                                                      border:
                                                                          true,
                                                                      radius: 5,
                                                                      borderColor:
                                                                          opendcityWhite,
                                                                      child:
                                                                          FittedBox(
                                                                        fit: BoxFit
                                                                            .scaleDown,
                                                                        child:
                                                                            TextWidget(
                                                                          text:
                                                                              model.genre,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),

                                                                const SizedBox(
                                                                    height: 10),

                                                                // Rating
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .star,
                                                                      color: Colors
                                                                          .amber,
                                                                      size: screenSize *
                                                                          0.02,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            5),
                                                                    TextWidget(
                                                                        text:
                                                                            '${model.rating}'),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                        // Action Buttons
                                                        SizedBox(
                                                          width:
                                                              screenSize * 0.12,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              IconButtonWidget(
                                                                icon:
                                                                    Icons.edit,
                                                                function: () =>
                                                                    navigateFromSde(
                                                                  context,
                                                                  MovieEdit(
                                                                      id: model
                                                                          .id!),
                                                                ),
                                                              ),
                                                              IconButtonWidget(
                                                                icon: Icons
                                                                    .delete_forever_rounded,
                                                                color: Colors
                                                                    .red
                                                                    .shade700,
                                                                function: () =>
                                                                    showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) =>
                                                                          DeleteMovie(
                                                                    movieId:
                                                                        model
                                                                            .id!,
                                                                    movieTitle:
                                                                        model
                                                                            .tittle,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  )
                                                ],
                                              );
                                            })
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: buttonPosition,
                builder: (context, value, child) => Positioned(
                    top: buttonPosition.value.dy,
                    left: buttonPosition.value.dx,
                    child: Draggable(
                        feedback: const SizedBox.shrink(),
                        child: IconButtonWidget(
                          icon: Icons.add,
                          backgroundColor: isDark.value
                              ? const Color(0xFF4B6CB7)
                              : const Color(0xFFFF6A88),
                          size: 30,
                          function: () => navigateFromBottomPush(
                              context, MoviesAddingPage()),
                        ),
                        onDragEnd: (details) {
                          buttonPosition.value = details.offset;
                          // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                          buttonPosition.notifyListeners();
                        })),
              )
            ]);
          },
        ));
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      required this.screenSize,
      required this.count,
      required this.icon,
      required this.item,
      required this.value});

  final double screenSize;
  final String count;
  final bool value;
  final IconData icon;
  final String item;

  @override
  Widget build(BuildContext context) {
    return Flexible(child: LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;
        return ContainerWidget(
          paddingH: 0.01,
          gredient1: value == true ? true : null,
          gradient: value == false ? true : null,
          height: isSmallScreen ? 0.13 : 0.3,
          radius: 20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  // ignore: deprecated_member_use
                  color: Colors.white.withOpacity(0.6),
                ),
                TextWidget(
                  text: count,
                  bold: FontWeight.w900,
                  size: screenSize * 0.035,
                  color: Colors.white,
                ),
                TextWidget(
                  text: item,
                  // ignore: deprecated_member_use
                  color: Colors.white.withOpacity(0.6),
                  size: screenSize * 0.015,
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}
