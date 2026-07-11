import 'package:first_project/core/constants/selected_genre.dart';
import 'package:first_project/core/constants/selected_language.dart';
import 'package:first_project/core/utils/helpers/feach_to_popup.dart';
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/control_panel/movie_management/controller/form_controller.dart';
import 'package:first_project/core/database/movie_oprations/movie_edit.dart';
import 'package:first_project/core/database/movie_oprations/feach_data.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:flutter/material.dart';

class MovieEditController extends MovieFormController {
  MovieEditController({required this.movieId}) {
    _hydrate();
  }

  final String movieId;
  late MovieModel _original;

  static String? requiredField(String? value, String message) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? urlField(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter a trailer link';
  }

  if (!Uri.parse(value.trim()).isAbsolute) {
    return 'Please enter a valid URL';
  }

  return null;
}
  void _hydrate() {
    _original = featch(id: movieId);

    titleController.text = _original.tittle;
    linkController.text = _original.link;
    descriptionController.text = _original.description;
    overviewController.text = _original.points;

    selectedGenre.value = _original.genre;
    selectedLanguage.value = _original.language;

    movieImages.value = [..._original.movieImages];
    castImages.value = [..._original.castImages];
    castNames.value = [..._original.castNames];
  }

  @override
  Future<MovieModel?> submit(BuildContext context) async {

    final error = validateAll();

    if (error != null) {
     
      showSnack(context, error, AppColors.error);
      return null;
    }
    

    isSubmitting = true;
    notifyListeners();

    try {
      final updated = MovieModel(
        id: _original.id,
        userId: _original.userId,
        comment: _original.comment,
        rating: _original.rating,
        tittle: titleController.text.trim(),
        genre: selectedGenre.value,
        language: selectedLanguage.value,
        link: linkController.text.trim(),
        description: descriptionController.text.trim(),
        points: overviewController.text.trim(),
        movieImages: movieImages.value,
        castImages: castImages.value,
        castNames: castNames.value,
      );

      await movieEdit(updated, movieId);

      if (!context.mounted) return null;

      showSnack(
        context,
        'Movie updated successfully!',
        AppColors.success,
      );

      Navigator.pop(context, {'id': updated.id});

      return updated;
    } catch (e) {
      showSnack(
        context,
        'Something went wrong. Please try again.',
        AppColors.error,
      );
      return null;
    } finally {
      isSubmitting = false;
      notifyListeners();
    }
  }

  Future<bool> handleBackNavigation() {
    return feachToPopUp(
      id: movieId,
      movieImages: movieImages,
      castImages: castImages,
      castNames: castNames,
    );
  }
}
