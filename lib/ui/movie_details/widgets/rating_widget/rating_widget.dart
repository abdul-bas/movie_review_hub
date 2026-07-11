
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/core/database/auth/rating.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget {
  const RatingWidget({
    super.key,
    this.currentIndex,
    this.movieId,
    this.model,
    this.onChanged,
  });

  final int? currentIndex;
  final String? movieId;
  final SignUpModel? model;
  final ValueChanged<int>? onChanged;

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  @override
  Widget build(BuildContext context) {
    final model = widget.model;
    final movieId = widget.movieId;
    final currentRating =
        (model != null && movieId != null) ? (model.index[movieId] ?? 0) : 0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(5, (index) {
        return SizedBox(
          width: 26,
          height: 26,
          child: Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                if (model == null || movieId == null) return;
                final newRating = index + 1;
                rating(indexValue: newRating, model: model, movieid: movieId);
                widget.onChanged?.call(newRating);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.accent,
                    behavior: SnackBarBehavior.floating,
                    content: Text('Thanks for rating: $newRating stars'),
                  ),
                );
              },
              child: Center(
                child: Icon(
                  currentRating > index
                      ? Icons.star_rounded
                      : Icons.star_border_rounded,
                  color: currentRating > index
                      ? AppColors.starRating
                      : AppColors.onSurfaceSubtle,
                  size: 18,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}