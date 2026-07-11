import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/movie_deteals/movie_details.dart';
import 'package:first_project/core/database/movie_oprations/get_movie.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/ui/common/container_widget.dart';
import 'package:first_project/routes/side_push.dart';
import 'package:flutter/material.dart';

class HomeScreenCarouselSlider extends StatefulWidget {
  const HomeScreenCarouselSlider({
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
  State<HomeScreenCarouselSlider> createState() =>
      _HomeScreenCarouselSliderState();
}

class _HomeScreenCarouselSliderState extends State<HomeScreenCarouselSlider> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final carouselHeight = widget.height * 0.23;

    return ValueListenableBuilder(
      valueListenable: movieDetailes,
      builder: (context, value, child) {
        return Column(
          children: [
            CarouselSlider(
              items: widget.movie.map((i) {
                final rating = i.rating ?? 0;

                return Builder(builder: (context) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppColors.cardRadius + 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.4),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppColors.cardRadius + 4),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ContainerWidget(
                            radius: AppColors.cardRadius + 4,
                            fileImage: i.movieImages[0],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withValues(alpha: 0.15),
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: 0.85),
                                ],
                                stops: const [0.0, 0.45, 1.0],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 20,
                            left: 0,
                            right: 100,
                            child: Align(
                              alignment: AlignmentGeometry.center,
                              child: Material(
                                color: AppColors.constWeght,
                                
                                shape: const CircleBorder(),
                                child: InkWell(
                                  customBorder: const CircleBorder(),
                                  onTap: () => navigateFromSide(
                                    context,
                                    MovieDetailsScreen(
                                      id: i.id!,
                                      userId: widget.userId,
                                      url: i.link,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Icon(
                                      Icons.play_arrow_rounded,

                                      color: Colors.black,
                                      size: 26,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 18,
                            right: 18,
                            bottom: 18,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        i.tittle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: -0.4,
                                        ),
                                      ),
                                      SizedBox(height: AppColors.space16),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (rating > 0) ...[
                                            const Icon(Icons.star_rounded,
                                                color: AppColors.starRating,
                                                size: 15),
                                            const SizedBox(width: 3),
                                            Text(
                                              rating.toStringAsFixed(1),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Container(
                                              width: 3,
                                              height: 3,
                                              decoration: const BoxDecoration(
                                                color: Colors.white54,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                          ],
                                          Flexible(
                                            child: Text(
                                              i.genre,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withValues(alpha: 0.75),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: AppColors.space12),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              }).toList(),
              options: CarouselOptions(
                height: carouselHeight,
                enlargeCenterPage: true,
                enlargeFactor: 0.18,
                viewportFraction: 0.86,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                onPageChanged: (index, reason) {
                  setState(() => _current = index);
                },
              ),
            ),
            const SizedBox(height: AppColors.space12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.movie.length, (index) {
                final active = index == _current;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: active ? 18 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: active ? AppColors.accent : AppColors.border,
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
