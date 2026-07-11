
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/core/database/auth/favorate.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:flutter/material.dart';

class FavorateWidget extends StatelessWidget {
  const FavorateWidget({
    super.key,
    required this.model,
    required this.movieId,
    this.iconColor,
  });

  final String movieId;
  final SignUpModel model;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final bool isFavorate = model.isFavorate[movieId] ?? false;

    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () => favorate(model: model, movieid: movieId, context: context),
        child: Center(
          child: Icon(
            isFavorate ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            color: isFavorate ? AppColors.error : (iconColor ?? AppColors.onSurfaceSubtle),
            size: 22,
          ),
        ),
      ),
    );
  }
}
