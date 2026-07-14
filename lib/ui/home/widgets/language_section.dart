import 'dart:io';
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/movie_deteals/movie_details.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/routes/center_push.dart';
import 'package:flutter/material.dart';

class LanguageSection extends StatelessWidget {
  const LanguageSection({super.key, 
    required this.language,
    required this.movies,
    required this.userId,
    required this.height,
  });

  final String language;
  final List<MovieModel> movies;
  final String userId;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppColors.space16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 18,
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: AppColors.space8),
                  Text(
                    language,
                    style:  TextStyle(
                      color: AppColors.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
              
            ],
          ),
        ),
        SizedBox(height: AppColors.space12),
        SizedBox(
          height: height,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: AppColors.space16),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Padding(
                padding: EdgeInsets.only(right: AppColors.space16),
                child:
                    SizedBox(
      width: height * 0.78 * 0.68,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppColors.cardRadius),
          onTap: () => navigateFromCenter(
            context: context,
            navigation: MovieDetailsScreen(
              userId: userId,
              id: movie.id!,
              url: movie.link,
            ),
          ),
          child: ClipRRect(
            child: Container( decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppColors.cardRadius),
                        ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: height * 0.78,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppColors.cardRadius),
                         
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppColors.cardRadius),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppColors.cardRadius),image: DecorationImage(image: FileImage(File(movie.movieImages[0])),fit: BoxFit.cover)),
                          
                          
                          ),
                        ),
                      ),
                      if (( movie.rating??0)  > 0)
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.65),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.star_rounded,
                                    color: AppColors.starRating, size: 13),
                                const SizedBox(width: 3),
                                Text(
                               (movie.rating??0).toStringAsFixed(1),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: AppColors.space8),
                  Text(
                    movie.tittle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStyle(
                      color: AppColors.onSurface,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    movie.genre,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.onSurfaceSubtle,
                      fontSize: 11.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
              );
            },
          ),
        ),
      ],
    );
  }
}