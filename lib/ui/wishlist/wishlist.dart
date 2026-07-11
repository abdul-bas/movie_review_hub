import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/wishlist/controller/controller.dart';
import 'package:first_project/ui/wishlist/widgets/empty_view.dart';
import 'package:first_project/ui/wishlist/widgets/grid.dart';
import 'package:first_project/core/database/auth/get_user_db.dart';
import 'package:first_project/core/database/movie_oprations/get_movie.dart';
import 'package:first_project/routes/pop_up.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key, required this.user});

  final SignUpModel user;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late final FavoriteController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FavoriteController(user: widget.user);
    _controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon:  Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.onSurface,
            size: 20,
          ),
          onPressed: () => popUp(context),
        ),
        title:  Text(
          'Favorites',
          style: TextStyle(
            color: AppColors.onSurface,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: AppColors.divider, height: 1),
        ),
      ),
      body: ValueListenableBuilder<List<SignUpModel>>(
        valueListenable: usersDetails,
        builder: (context, users, _) {
          final currentUser = _controller.resolveUser(users);

          return ValueListenableBuilder<List<MovieModel>>(
            valueListenable: movieDetailes,
            builder: (context, movies, _) {
              final favorites = _controller.getFavoriteMovies(users, movies);

              if (favorites.isEmpty) {
                return const EmptyFavoritesView();
              }

              return FavoritesGrid(
                favorites: favorites,
                currentUser: currentUser,
              );
            },
          );
        },
      ),
    );
  }
}
