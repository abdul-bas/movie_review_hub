import 'package:first_project/core/constants/genre.dart';
import 'package:first_project/core/constants/language.dart';
import 'package:first_project/core/constants/selected_genre.dart';
import 'package:first_project/core/constants/selected_language.dart';
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/control_panel/admin_dashboard/controller/controller.dart';
import 'package:first_project/ui/control_panel/movie_management/controller/edit_controller.dart';
import 'package:first_project/ui/control_panel/movie_management/dialogs/cast_dialog.dart';
import 'package:first_project/ui/control_panel/movie_management/widgets/app_button.dart';
import 'package:first_project/ui/control_panel/movie_management/widgets/cast_list.dart';
import 'package:first_project/ui/control_panel/movie_management/widgets/dropdown.dart';
import 'package:first_project/ui/control_panel/movie_management/widgets/movie_photo_picker.dart';
import 'package:first_project/ui/control_panel/movie_management/widgets/section_label.dart';
import 'package:first_project/ui/control_panel/movie_management/widgets/text_field.dart';
import 'package:flutter/material.dart';

class MovieEditPage extends StatefulWidget {
  const MovieEditPage({super.key, required this.movieId});

  final String movieId;

  @override
  State<MovieEditPage> createState() => _MovieEditPageState();
}

class _MovieEditPageState extends State<MovieEditPage> {
  late final MovieEditController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MovieEditController(movieId: widget.movieId);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, color: AppColors.onSurface),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title:  Text(
          'Edit Movie',
          style: TextStyle(
              fontWeight: FontWeight.w800,
              color: AppColors.onSurface,
              fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            AppColors.space16,
            AppColors.space8,
            AppColors.space16,
            AppColors.space32,
          ),
          child: Form(
            key:_controller.formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionLabel(text: 'Movie Photos'),
                  ValueListenableBuilder<List<String>>(
                    valueListenable: _controller.movieImages,
                    builder: (context, images, _) {
                      return MoviePhotoPicker(
                        imagePaths: images,
                        onAdd: _controller.addMovieImage,
                        onRemove: _controller.removeMovieImage,
                      );
                    },
                  ),
                  const SizedBox(height: AppColors.space20),
                  AppTextField(
                    controller: _controller.titleController,
                    label: 'Movie Title',
                    hint: 'Movie Title',
                    icon: Icons.title,
                    validator: (v) => MovieEditController.requiredField(
                        v, 'Please enter a title'),
                  ),
                  const SizedBox(height: AppColors.space16),
                  Row(
                    children: [
                      Expanded(
                        child: AppDropdownField(
                          label: 'Genre',
                          items: genre,
                          selection: selectedGenre,
                        ),
                      ),
                      const SizedBox(width: AppColors.space12),
                      Expanded(
                        child: AppDropdownField(
                          label: 'Language',
                          items: language,
                          selection: selectedLanguage,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppColors.space16),
                  AppTextField(
                    controller: _controller.linkController,
                    label: 'Trailer Link',
                    hint: 'Trailer Link',
                    icon: Icons.link,
                    keyboardType: TextInputType.url,
                    validator: MovieEditController.urlField,
                  ),
                  const SizedBox(height: AppColors.space16),
                  AppTextField(
                    controller: _controller.descriptionController,
                    label: 'Movie Description',
                    hint: 'Movie Description',
                    icon: Icons.description_outlined,
                    maxLines: 5,
                    validator: (v) => MovieEditController.requiredField(
                        v, 'Please enter a description'),
                  ),
                  const SizedBox(height: AppColors.space16),
                  AppTextField(
                    controller: _controller.overviewController,
                    label: 'Overview about the movie',
                    hint: 'Overview about the movie',
                    icon: Icons.person_outline,
                    maxLines: 5,
                    validator: (v) => MovieEditController.requiredField(
                        v, 'Please enter an overview'),
                  ),
                  const SizedBox(height: AppColors.space20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionLabel(text: 'Cast List'),
                      AppButton(
                        label: 'Add Cast',
                        icon: Icons.add,
                        onPressed: ()=>AdminDashboardController.openAddCastDialog(context,_controller),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppColors.space12),
                  ValueListenableBuilder<List<String>>(
                    valueListenable: _controller.castImages,
                    builder: (context, images, _) {
                      return ValueListenableBuilder<List<String>>(
                        valueListenable: _controller.castNames,
                        builder: (context, names, __) {
                          return CastList(
                            imagePaths: images,
                            names: names,
                            onRemove: _controller.removeCastEntry,
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: AppColors.space24),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, _) {
                      return AppButton(
                        label: 'Save Changes',
                        isPrimary: true,
                        expand: true,
                        isLoading: _controller.isSubmitting,
                        onPressed:()=> _controller.submit(context),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
