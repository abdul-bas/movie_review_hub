import 'package:first_project/core/constants/selected_genre.dart';
import 'package:first_project/core/constants/selected_language.dart';
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/core/database/movie_oprations/movie_add.dart';
import 'package:first_project/core/utils/helpers/image_picker.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MovieFormController extends ChangeNotifier {
  MovieFormController();

  final titleController = TextEditingController();
  final linkController = TextEditingController();
  final descriptionController = TextEditingController();
  final overviewController = TextEditingController();
  final castNameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final ImagePicker _moviePicker = ImagePicker();
  final ImagePicker _castPicker = ImagePicker();

  final ValueNotifier<List<String>> movieImages =
      ValueNotifier<List<String>>([]);

  final ValueNotifier<List<String>> castImages =
      ValueNotifier<List<String>>([]);

  final ValueNotifier<List<String>> castNames = ValueNotifier<List<String>>([]);

  String? pendingCastPhoto;
  bool isSubmitting = false;

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

    if (!value.startsWith('http://') && !value.startsWith('https://')) {
      return 'URL must start with http:// or https://';
    }

    return null;
  }

  Future<void> addMovieImage() async {
    final picked = await pickImg(imagePicker: _moviePicker);

    if (picked != null) {
      movieImages.value = [...movieImages.value, picked];
    }
  }

  void removeMovieImage(int index) {
    final updated = [...movieImages.value]..removeAt(index);
    movieImages.value = updated;
  }

  Future<String?> pickCastPhoto() async {
    final picked = await pickImg(imagePicker: _castPicker);

    if (picked != null) {
      pendingCastPhoto = picked;
      notifyListeners();
    }

    return picked;
  }

  String? commitCastEntry() {
    final name = castNameController.text.trim();

    if (pendingCastPhoto == null) {
      return 'Please add a cast photo';
    }

    if (name.isEmpty) {
      return 'Please enter a cast name';
    }

    castImages.value = [...castImages.value, pendingCastPhoto!];
    castNames.value = [...castNames.value, name];

    pendingCastPhoto = null;
    castNameController.clear();

    notifyListeners();

    return null;
  }

  void resetCastDialogState() {
    pendingCastPhoto = null;
    castNameController.clear();
    notifyListeners();
  }

  void removeCastEntry(int index) {
    final images = [...castImages.value]..removeAt(index);
    final names = [...castNames.value]..removeAt(index);

    castImages.value = images;
    castNames.value = names;
  }

  String? validateAll() {
    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return 'Please fix the highlighted fields.';
    }

    if (movieImages.value.isEmpty) {
      return 'Please add at least one movie photo.';
    }

    if (castImages.value.isEmpty || castNames.value.isEmpty) {
      return 'Please add at least one cast member.';
    }

    return null;
  }

  Future<MovieModel?> submit(BuildContext context) async {
    if (isSubmitting) return null;

    final validation = validateAll();

    if (validation != null) {
      showSnack(
        context,
        validation,
        AppColors.error,
      );
      return null;
    }

    isSubmitting = true;
    notifyListeners();

    try {
      final movie = MovieModel(
        tittle: titleController.text.trim(),
        genre: selectedGenre.value,
        language: selectedLanguage.value,
        link: linkController.text.trim(),
        description: descriptionController.text.trim(),
        points: overviewController.text.trim(),
        castImages: castImages.value,
        castNames: castNames.value,
        movieImages: movieImages.value,
        rating: 0,
      );

      await movieAdd(movie);

      clearForm();
      if (!context.mounted) return null;
      showSnack(
        context,
        'Movie added successfully!',
        AppColors.success,
      );

      return movie;
    } catch (e) {
      showSnack(
        context,
        'Failed to add movie.',
        AppColors.error,
      );

      return null;
    } finally {
      isSubmitting = false;
      Navigator.pop(context);
      notifyListeners();
    }
  }

  void clearForm() {
    titleController.clear();
    linkController.clear();
    descriptionController.clear();
    overviewController.clear();
    castNameController.clear();

    movieImages.value = [];
    castImages.value = [];
    castNames.value = [];

    pendingCastPhoto = null;
  }

  void showSnack(
    BuildContext context,
    String message,
    Color color,
  ) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: color,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppColors.fieldRadius,
            ),
          ),
        ),
      );
  }

  @override
  void dispose() {
    titleController.dispose();
    linkController.dispose();
    descriptionController.dispose();
    overviewController.dispose();
    castNameController.dispose();

    movieImages.dispose();
    castImages.dispose();
    castNames.dispose();

    super.dispose();
  }
}
