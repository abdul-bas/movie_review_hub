
import 'package:first_project/core/database/auth/get_user_db.dart';
import 'package:first_project/core/database/movie_oprations/get_movie.dart';
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:first_project/ui/home/widgets/genre_card.dart';
import 'package:flutter/material.dart';
class GenreWidget extends StatefulWidget {
  const GenreWidget({
    super.key,
    required this.genre,
    required this.icon,
    required this.color,
    required this.userId,
  });

  final String genre;
  final IconData icon;
  final Color color;
  final String userId;

  @override
  State<GenreWidget> createState() => _GenreWidgetState();
}

class _GenreWidgetState extends State<GenreWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getUserData());
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<MovieModel>>(
      valueListenable: movieDetailes,
      builder: (context, movies, child) {
        if (movies.isEmpty) {
          return Expanded(
            child: const Center(
              child: Text('Movies Are Not Available'),
            ),
          );
        }

        final model =
            movies.where((e) => e.genre == widget.genre).toList();

        if (model.isEmpty) {
          return Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.icon,
                    color: AppColors.onSurfaceSubtle,
                    size: 40,
                  ),
                  SizedBox(height: AppColors.space12),
                  Text(
                    'No ${widget.genre} Movies Found',
                    style: TextStyle(
                      color: AppColors.onSurfaceSubtle,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return ValueListenableBuilder<List<SignUpModel>>(
          valueListenable: usersDetails,
          builder: (context, users, child) {
            if (users.isEmpty) {
              return const SizedBox.shrink();
            }

            final userModel = users.firstWhere(
              (e) => e.id == widget.userId,
              orElse: () => users.first,
            );

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                AppColors.space16,
                AppColors.space16,
                AppColors.space16,
                AppColors.space32,
              ),
              itemCount: model.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: AppColors.space16,
                  ),
                  child: GenreMovieCard(
                    data: model[index],
                    userModel: userModel,
                    userId: widget.userId,
                    accentColor: widget.color,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}