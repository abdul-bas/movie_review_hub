
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/movie_details/widgets/carousel_slider_widget/carousel_silder_widget.dart';
import 'package:first_project/ui/movie_details/widgets/commen/text_button.dart';
import 'package:first_project/ui/movie_details/widgets/favorate_widget/favorate_widget.dart';
import 'package:first_project/ui/movie_details/widgets/movie_details/details_section.dart';
import 'package:first_project/ui/movie_details/widgets/rating_widget/rating_widget.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:first_project/ui/common/container_widget.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
   MovieDetails({
    super.key,
    required this.model,
    required this.usermodel,
    required this.height,
    required this.currentIndex,
    required this.isVisible,
    required this.onRatingChanged,
  });

  final MovieModel model;
  final SignUpModel usermodel;
  final double height;
  final int currentIndex;
  final ValueNotifier<bool> isVisible;
  final ValueChanged<int> onRatingChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppColors.space16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(height: AppColors.space16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  model.tittle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:  TextStyle(
                    color: AppColors.onSurface,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                ),
              ),
              FavorateWidget(model: usermodel, movieId: model.id!),
            ],
          ),
           SizedBox(height: AppColors.space8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                spacing: AppColors.space8,
                children: [
                  TextButtons(text: model.genre),
                  TextButtons(text: model.language),
                ],
              ),
              RatingWidget(
                movieId: model.id!,
                currentIndex: currentIndex,
                model: usermodel,
                onChanged: onRatingChanged,
              ),
            ],
          ),
           SizedBox(height: AppColors.space16),
          InkWell(
            borderRadius: BorderRadius.circular(AppColors.fieldRadius),
            onTap: () => isVisible.value = false,
            child: Container(
              width: double.infinity,
              padding:  EdgeInsets.all(AppColors.space12),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppColors.fieldRadius),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                   Icon(Icons.chat_bubble_outline_rounded,
                      color: AppColors.onSurfaceSubtle, size: 18),
                   SizedBox(width: AppColors.space8),
                  Text(
                    'View comments',
                    style:  TextStyle(
                      color: AppColors.onSurfaceSubtle,
                      fontSize: 13,
                    ),
                  ),
                   Spacer(),
                  Container(
                    padding:
                         EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.accentSubtle,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${model.comment?.length ?? 0}',
                      style:  TextStyle(
                        color: AppColors.accent,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SectionTitle('Cast'),
          SizedBox(
            height: height * 0.14,
            child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: model.castImages.length,
      separatorBuilder: (_, __) =>  SizedBox(width: AppColors.space12),
      itemBuilder: (context, index) {
        final names = model.castNames[index];
        final images = model.castImages[index];
        return SizedBox(
          width: 72,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: ContainerWidget(
                  fileImage: images,
                  height: 0.08,
                  width: 0.16,
                ),
              ),
               SizedBox(height: AppColors.space4),
              Text(
                names,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style:  TextStyle(
                  color: AppColors.onSurfaceSubtle,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        );
      },
    ),
          ),
          SectionTitle('Synopsis'),
          Text(
            model.description,
            style:  TextStyle(
              color: AppColors.onSurfaceSubtle,
              fontSize: 13,
              height: 1.5,
            ),
          ),
          SectionTitle('Movie Stills'),
          CarouselSliderWidget(model: model),
          SectionTitle('Overview'),
          Text(
            model.points,
            style:  TextStyle(
              color: AppColors.onSurfaceSubtle,
              fontSize: 13,
              height: 1.5,
            ),
          ),
           SizedBox(height: AppColors.space32),
       SizedBox(height: 300,
         child: Opacity(opacity: 0.3,
          child: Image.asset('assets/Screenshot_2024-12-28_142342-removebg-preview.png')),
       ) ],
      ),
    );
  }
}
