

import 'package:first_project/ui/wishlist/widgets/movie_card.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:flutter/material.dart';

class FavoritesGrid extends StatelessWidget {
  const FavoritesGrid({super.key, 
    required this.favorites,
    required this.currentUser,
  });

  final List<MovieModel> favorites;
  final SignUpModel currentUser;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 24),
      itemCount: favorites.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 14,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, index) {
        return FavoriteMovieCard(
          movie: favorites[index],
          currentUser: currentUser,
        );
      },
    );
  }
}