import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/home/widgets/carousel_slider.dart';
import 'package:first_project/ui/home/widgets/language_section.dart';
import 'package:first_project/core/database/auth/get_user_db.dart';
import 'package:first_project/core/database/movie_oprations/get_movie.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/ui/common/text_widget.dart';
import 'package:flutter/material.dart';

class All extends StatefulWidget {
  const All({super.key, required this.userId});
  final String userId;

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getUserData();
      getMovie();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ValueListenableBuilder(
      valueListenable: usersDetails,
      builder: (context, user, child) {
        if (user.isEmpty) return const SizedBox.shrink();

        final userMatches = user.where((e) => e.id == widget.userId);
        if (userMatches.isEmpty) return const SizedBox.shrink();
        final userModel = userMatches.first;

        return ValueListenableBuilder(
          valueListenable: movieDetailes,
          builder: (context, List<MovieModel> movie, child) {
           if (movie.isEmpty) {
          return  Center(
            child: TextWidget(
              text: 'Movies Are Not Available',
              color: AppColors.onSurface,
              size: 13,
              bold: FontWeight.w500,
            ),
          );
        }

            final unique = movie.map((e) => e.language).toSet().toList();

            return LayoutBuilder(
              builder: (context, constraints) {
                final smallScreen = constraints.maxWidth < 500;

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppColors.space6),
                      HomeScreenCarouselSlider(
                        userId: userModel.id!,
                        width: width,
                        height: height,
                        movie: movie,
                      ),
                      const SizedBox(height: AppColors.space32),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: unique.length,
                        itemBuilder: (context, index) {
                          final language = unique[index];
                          final images = movie
                              .where((e) => e.language == language)
                              .toList();
                  
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: AppColors.space24),
                            child: LanguageSection(
                              language: language,
                              movies: images,
                              userId: widget.userId,
                              height:
                                  smallScreen ? height * 0.26 : height * 0.32,
                            ),
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


