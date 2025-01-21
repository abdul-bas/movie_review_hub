import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/depending_data/dropdown_list.dart';
import 'package:review_hub/depending_data/snacbar.dart';
import 'package:review_hub/function/hive_functions/movie_add_functions/get_movie.dart';
import 'package:review_hub/function/hive_functions/movie_add_functions/movie_edit.dart';
import 'package:review_hub/function/other_function/feach_data.dart';
import 'package:review_hub/function/pop_up.dart';
import 'package:review_hub/main.dart';
import 'package:review_hub/model/movie_model.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/adding_button.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/alert_dialog.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/cast_list_view.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/dropdown.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/images_card.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/text.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/text_button_icon.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/text_field.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/home_page.dart';


class MovieEdit extends StatefulWidget {
  const MovieEdit({super.key, required this.id});
  final String id;

  @override
  State<MovieEdit> createState() => _MovieEditState();
}

class _MovieEditState extends State<MovieEdit> {
  ImagePicker imagePicker = ImagePicker();

  ImagePicker imagePicker1 = ImagePicker();

  ValueNotifier<List<String>>? movieImages = ValueNotifier([]);
  ValueNotifier<List<String>> castImages = ValueNotifier([]);
  ValueNotifier<List<String>> castNames = ValueNotifier([]);
  String? castPhoto;
  @override
  void dispose() {
   
    super.dispose();
    _tittle.dispose();
    _link.dispose();
    _description.dispose();
    _points.dispose();
  }

  final TextEditingController _tittle = TextEditingController();

  final TextEditingController _link = TextEditingController();

  final TextEditingController _description = TextEditingController();

  final TextEditingController _points = TextEditingController();
  @override
  void initState() {

    super.initState();
    getMovie();
    final data = featch(id: widget.id);
    _tittle.text = data.tittle;
    _link.text = data.link;
    _description.text = data.description;
    _points.text = data.points;
    selectedGenre.value = data.genre;
    selectedLanguage.value = data.language;
    movieImages!.value.addAll(data.movieImages);
    castImages.value.addAll(data.castImages);
    castNames.value.addAll(data.castNames);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () {
        return feachToPopUp(
            id: widget.id,
            movieImages: movieImages!,
            castImages: castImages,
            castNames: castNames);
      },
      child: Scaffold(
          backgroundColor: bagroundBlack,
          appBar: AppBar(
            backgroundColor: bagroundBlack,
            leading: IconButtonWidget(
              icon: Icons.arrow_back,
              function: () => popUp(context),
            ),
            title:  TextButtonIconWidget(
              label: 'Edit Movie',
              icon: Icons.movie,
              color: textWeight,
              bold: FontWeight.w900,
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              child: Column(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextAddingWidget(
                    width: width,
                    text: 'Movie Photos',
                  ),
                  PickingMovieImagesWidget(
                      movieImages: movieImages,
                      height: height,
                      width: width,
                      imagePicker: imagePicker),
                  AddingPageTextFormStyle(
                    hint: 'Movie Title',
                    label: 'Movie Title',
                    icon: Icons.title,
                    controller: _tittle,
                    validation: (value) => value == null || value.isEmpty,
                    textForValidatoin: 'Please enter tittle',
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: DropdownButtonFormFieldWidget(
                        selectedItem: selectedGenre,
                        catogary: 'Genre',
                        items: genre,
                        paddingH: 0.028,
                      )),
                      Expanded(
                          child: DropdownButtonFormFieldWidget(
                        selectedItem: selectedLanguage,
                        catogary: 'Language',
                        items: language,
                        paddingH: 0.028,
                      )),
                    ],
                  ),
                  AddingPageTextFormStyle(
                    controller: _link,
                    validation: (value) => !RegExp(
                            r'^(https?:\/\/)?([a-zA-Z0-9]+\.[a-zA-Z]{2,})([\/\w .-]*)*\/?$')
                        .hasMatch(value),
                    textForValidatoin: 'Please enter a valid URL',
                    hint: 'Triler Link',
                    label: 'Triler Link',
                    icon: Icons.link,
                  ),
                  AddingPageTextFormStyle(
                      hint: 'Movie Description',
                      validation: (value) => value == null || value.isEmpty,
                      controller: _description,
                      label: 'Movie Description',
                      textForValidatoin: 'Please enter Description',
                      icon: Icons.description,
                      maxLine: 5),
                  AddingPageTextFormStyle(
                      hint: 'Carecter Pointes',
                      validation: (value) => value == null || value.isEmpty,
                      controller: _points,
                      label: 'Carecter Pointes',
                      textForValidatoin: 'Please enter Pointes',
                      icon: Icons.person_outlined,
                      maxLine: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextAddingWidget(
                        width: width,
                        text: 'Cast List',
                      ),
                      // ignore: deprecated_member_use
                      ButtonInAdding(bagroundColor: isDark.value? Colors.grey[900]:Colors.grey.withOpacity(0.5),
                        height: 0.045,
                        width: 0.3,
                        function: () => showDialog(
                            context: context,
                            builder: (context) => AddingAlertWidget(
                                  castImages: castImages,
                                  castNames: castNames,
                                  castPhoto: castPhoto,
                                  height: height,
                                  imagePicker1: imagePicker1,
                                  width: width,
                                )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: null,
                    child: CastListWidget(
                      height: height,
                      castImages: castImages,
                      castNames: castNames,
                    ),
                  ),
                  // ignore: deprecated_member_use
                  ButtonInAdding(bagroundColor: isDark.value? Colors.grey[900]:Colors.grey.withOpacity(0.5),
                    function: () => edit(
                      context,
                    ),
                    height: 0.06,
                    width: width,
                  ),
                  const SizedBoxWidget()
                ],
              ),
            ),
          )),
    );
  }

  edit(BuildContext context) async {
   
    setState(() {
      final data = featch(id: widget.id);
    final description = _description.text.trim();
    final link = _link.text.trim();
    final points = _points.text.trim();
    final title = _tittle.text.trim();
    if (description.isNotEmpty &&
        link.isNotEmpty &&
        title.isNotEmpty &&
        points.isNotEmpty &&
        movieImages != null &&
        movieImages!.value.isNotEmpty &&

        // ignore: unnecessary_null_comparison
        castImages != null &&
        castImages.value.isNotEmpty &&
        // ignore: unnecessary_null_comparison
        castNames != null &&
        castNames.value.isNotEmpty) {
      final value = MovieModel(
          tittle: title,
          genre: selectedGenre.value,
          language: selectedLanguage.value,
          link: link,
          description: description,
          points: points,
          castImages: castImages.value,
          castNames: castNames.value,
          movieImages: movieImages!.value,
          comment: data.comment,
          id: data.id,
          rating: data.rating,
          userId: data.userId,);
      movieEdit(value, widget.id);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop({'id': value.id});
      SnackBarFunction(
          // ignore: use_build_context_synchronously
          context: context,
          text: "Edit successful. Movie details updated.",
          color: blue);
    } else {
      // ignore: avoid_print
      print('egbt4b.............................................');
    }
    });
  }
}
