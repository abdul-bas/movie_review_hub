import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/categories/widgets/categories_reel_page.dart';
import 'package:first_project/routes/pop_up.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.userId,
    required this.genre,
    required this.gredientOne,
    required this.gredientThree,
    required this.gredientTwo,
    required this.icon,
    required this.color,
    required this.movieList,
  });

  final String userId;
  final String genre;
  final IconData icon;
  final Color gredientOne;
  final Color gredientTwo;
  final Color gredientThree;
  final Color color;
  final ValueNotifier<List<MovieModel>> movieList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Material(
              color: Colors.black.withValues(alpha: 0.25),
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () => popUp(context),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.arrow_back_ios_new_rounded,
                      color: Colors.white, size: 18),
                ),
              ),
            ),
          ),
          backgroundColor: AppColors.background,
          expandedHeight: 190,
          pinned: true,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [gredientOne, gredientTwo, gredientThree],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
                  child: ValueListenableBuilder<List<MovieModel>>(
                    valueListenable: movieList,
                    builder: (context, value, child) {
                      final count =
                          value.where((e) => e.genre == genre).length;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.18),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(icon, color: color, size: 28),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            '$genre Movies',
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.w800,
                              fontSize: 26,
                              letterSpacing: -0.4,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$count title${count == 1 ? '' : 's'} available',
                            style: TextStyle(
                              color: color.withValues(alpha: 0.85),
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        ValueListenableBuilder<List<MovieModel>>(
          valueListenable: movieList,
          builder: (context, value, child) {
            final model =
                value.where((element) => element.genre == genre).toList();

            if (model.isEmpty) {
              return SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.movie_filter_outlined,
                            color: AppColors.onSurfaceSubtle, size: 44),
                        const SizedBox(height: 12),
                        Text(
                          'No $genre movies available',
                          style:  TextStyle(
                            color: AppColors.onSurfaceSubtle,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            return SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.82,
                child: CategoriesReelPager(
                  movies: model,
                  accentColor: color,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
