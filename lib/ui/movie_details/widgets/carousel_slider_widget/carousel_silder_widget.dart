
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/ui/common/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key, required this.model});

  final MovieModel model;

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    if (widget.model.movieImages.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        SizedBox(
          height: height * 0.22,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.model.movieImages.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppColors.space4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppColors.cardRadius),
                  child: ContainerWidget(
                    fileImage: widget.model.movieImages[index],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: AppColors.space8),
        SmoothPageIndicator(
          controller: _controller,
          count: widget.model.movieImages.length,
          effect:  WormEffect(
            activeDotColor: AppColors.accent,
            dotColor: AppColors.border,
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
      ],
    );
  }
}