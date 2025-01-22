import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/depending_data/navigations.dart';
import 'package:first_project/function/hive_functions/log_functions/get_user_db.dart';
import 'package:first_project/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/home_page.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/pages/movie_deteals/movie_deteals.dart';
import 'package:first_project/widget/container_widget.dart';
import 'package:first_project/widget/text_widget.dart';
import 'package:flutter/material.dart';


class All extends StatelessWidget {
  const All({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    getUserData();
    getMovie();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ValueListenableBuilder(
      valueListenable: usersDetails,
      builder: (context, user, child) {
        if (user.isEmpty) {
          return const SizedBox.shrink();
        }
        final userModel = user.firstWhere(
          (element) => element.id == userId,
        );

        return ValueListenableBuilder(
          valueListenable: movieDetailes,
          builder: (context, List<MovieModel> movie, child) {
            if (movie.isEmpty) {
              return const Center(
                child: TextWidget(text: 'Movies Are Not Available'),
              );
            }

            final unique = movie.map((e) => e.language).toSet().toList();

            return LayoutBuilder(
              builder: (context, constraints) {
                final smallScreen = constraints.maxWidth < 500;

                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      CarouselSliderWidget(
                        userId: userModel.id!,
                        width: width,
                        height: height,
                        movie: movie,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: unique.length,
                        itemBuilder: (context, index) {
                          final language = unique[index];
                          final images = movie
                              .where((element) => element.language == language)
                              .toList();

                          return Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              // Language title
                              TextWidget(
                                text: language,
                                bold: FontWeight.w800,
                                size: 16,
                                paddingH: 0.02,
                              ),

                              // Horizontal movie list
                              SizedBox(
                                height:
                                    smallScreen ? height * 0.2 : height * 0.3,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: images.length,
                                  itemBuilder: (context, subIndex) {
                                    final img = images[subIndex];
                                    return ContainerWidget(
                                      onTap: () => navigateFromCenter(
                                        context: context,
                                        navigation: MovieDeteals(
                                          userId: userId,
                                          id: img.id!,
                                          url: img.link,
                                        ),
                                      ),
                                      width: 0.27,
                                      paddingH: 0.008,
                                      paddingV: 0.03,
                                      radius: 10,
                                      border: true,
                                      fileImage: img.movieImages[0],
                                      borderColor: opendcityWhite,
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
    required this.width,
    required this.height,
    required this.movie,
    required this.userId,
  });

  final double width;
  final double height;
  final List<MovieModel> movie;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: movieDetailes,
      builder: (context, value, child) {
        return SingleChildScrollView(
          child: CarouselSlider(
            items: movie.map((i) {
              return Builder(builder: (context) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: width * 0.01,
                  ),
                  child: ContainerWidget(
                    border: true,
                    borderColor: opendcityWhite,
                    radius: 15,
                    fileImage: i.movieImages[0],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left content column
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // Title with constrained box
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: width *
                                          0.6, // Adjust based on your needs
                                    ),
                                    child: TextNormalWidget(
                                      text: i.tittle,
                                      bold: FontWeight.w800,
                                      paddingH: 0.025,
                                      size: 18, maxLines: 1,color: Colors.white ,
                                      // Allow up to 2 lines
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  // Review text
                                   const TextWidget(
                                    text: 'Read Review',
                                    size: 13,
                                    bold: FontWeight.w300,color: Colors.white,
                                  ),
                                  // Rating stars
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(5, (ind) {
                                      return Flexible(
                                        child: SizedBox(
                                          height: height * 0.03,
                                          width: width * 0.045,
                                          child: IconButtonWidget(
                                            icon: i.rating! < ind + 1
                                                ? Icons.star_border_outlined
                                                : Icons.star,
                                            color: i.rating! < ind + 1
                                                ? Colors.white
                                                : Colors.amberAccent,
                                            size: height * 0.02,
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Play button
                          Flexible(
                            child: IconButtonWidget(
                              icon: Icons.play_circle_fill_rounded,
                              size: height * 0.08,color: Colors.white70,
                              function: () => navigateFromSde(
                                context,
                                MovieDeteals(
                                  id: i.id!,
                                  userId: userId,
                                  url: i.link,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
            }).toList(),
            options: CarouselOptions(
              enlargeCenterPage: true,
              viewportFraction: 1,
            ),
          ),
        );
      },
    );
  }
}
