
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/movie_details/widgets/favorate_widget/favorate_widget.dart';
import 'package:first_project/ui/movie_deteals/movie_details.dart';
import 'package:first_project/ui/wishlist/controller/controller.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:first_project/routes/push_replacement_bottom.dart';
import 'package:flutter/material.dart';

class FavoriteMovieCard extends StatelessWidget {
  const FavoriteMovieCard({
    super.key,
    required this.movie,
    required this.currentUser,
  });

  final MovieModel movie;
  final SignUpModel currentUser;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FavoriteController.goToDetails(context,movie,currentUser),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppColors.cardRadius),
          border: Border.all(color: AppColors.border, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.35),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 7,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    movie.movieImages[0],
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: AppColors.surfaceElevated,
                      child: Icon(
                        Icons.movie_outlined,
                        color: AppColors.onSurfaceSubtle,
                        size: 40,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 48,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              AppColors.surface.withValues(alpha: 0.95),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.background.withValues(alpha: 0.65),
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: FavorateWidget(
                        model: currentUser,
                        movieId: movie.id!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.surface,
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.tittle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.onSurface,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: AppColors.starRating,
                        size: 13,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${movie.rating}',
                        style: const TextStyle(
                          color: AppColors.starRating,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
