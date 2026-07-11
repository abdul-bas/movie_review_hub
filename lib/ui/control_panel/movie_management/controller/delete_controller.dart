import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/core/database/movie_oprations/delete_movie.dart';
import 'package:flutter/material.dart';

class DeleteMovieController extends ChangeNotifier {
  DeleteMovieController({required this.movieId});

  final String movieId;
  bool isDeleting = false;

  Future<bool> _delete(BuildContext context) async {
    isDeleting = true;
    notifyListeners();

    try {
      await deleteMovie(id: movieId, context: context);
      return true;
    } catch (_) {
      return false;
    } finally {
      isDeleting = false;
      notifyListeners();
    }
  }

  Future<void> handleDelete(BuildContext context) async {
    final success = await _delete(context);
    if (!context.mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          success
              ? 'Movie deleted successfully!'
              : 'Could not delete movie. Please try again.',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: success ? AppColors.success : AppColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppColors.fieldRadius)),
      ),
    );
    Navigator.pop(context);
  }
}
