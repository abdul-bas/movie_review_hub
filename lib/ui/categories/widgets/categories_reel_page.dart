
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/categories/widgets/categories_reel_card.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:flutter/material.dart';

class CategoriesReelPager extends StatefulWidget {
  const CategoriesReelPager({super.key, required this.movies, required this.accentColor});

  final List<MovieModel> movies;
  final Color accentColor;

  @override
  State<CategoriesReelPager> createState() => CategoriesReelPagerState();
}

class CategoriesReelPagerState extends State<CategoriesReelPager> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.movies.length,
          onPageChanged: (index) => setState(() => _current = index),
          itemBuilder: (context, index) {
            return CategoriesReelCard(
              key: ValueKey(widget.movies[index].id),
              data: widget.movies[index],
              accentColor: widget.accentColor,
            );
          },
        ),
        // Vertical progress dots
        if (widget.movies.length > 1)
          Positioned(
            right: 12,
            top: 0,
            bottom: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(widget.movies.length, (index) {
                  final active = index == _current;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    width: 6,
                    height: active ? 18 : 6,
                    decoration: BoxDecoration(
                      color: active
                          ? widget.accentColor
                          : AppColors.border,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  );
                }),
              ),
            ),
          ),
      ],
    );
  }
}
