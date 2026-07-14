
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/common/container_widget.dart';
import 'package:first_project/ui/movie_details/widgets/favorate_widget/favorate_widget.dart';
import 'package:first_project/ui/movie_deteals/movie_details.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:first_project/routes/center_push.dart';
import 'package:flutter/material.dart';
class GenreMovieCard extends StatelessWidget {
  const GenreMovieCard({
    super.key,
    required this.data,
    required this.userModel,
    required this.userId,
    required this.accentColor,
  });

  final MovieModel data;
  final SignUpModel userModel;
  final String userId;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final rating = data.rating ?? 0;
    final hasImage = data.movieImages.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(AppColors.cardRadius),
       
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Poster with play overlay
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppColors.cardRadius),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  hasImage
                      ? ContainerWidget(fileImage: data.movieImages[0])
                      : Container(
                          color: AppColors.surfaceElevated,
                          child: Icon(
                            Icons.movie_outlined,
                            color: AppColors.onSurfaceSubtle,
                            size: 32,
                          ),
                        ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.1),
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.55),
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),
                  Center(
                    child: Material(
                      color: Colors.white.withValues(alpha: 0.9),
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () => navigateFromCenter(
                          context: context,
                          navigation: MovieDetailsScreen(
                            id: data.id!,
                            userId: userId,
                            url: data.link,
                          ),
                        ),
                        child:  Padding(
                          padding: EdgeInsets.all(14),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: AppColors.bagroundWeight,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (rating > 0)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.65),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.star_rounded,
                                color: AppColors.starRating, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              rating.toStringAsFixed(1),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(AppColors.space16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.tittle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.onSurface,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.2,
                      ),
                    ),
                    SizedBox(height: AppColors.space8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: accentColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        data.genre,
                        style: TextStyle(
                          color: accentColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: AppColors.space8),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: FavorateWidget(
                    model: userModel,
                    movieId: data.id!,
                    iconColor: AppColors.onSurfaceSubtle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}