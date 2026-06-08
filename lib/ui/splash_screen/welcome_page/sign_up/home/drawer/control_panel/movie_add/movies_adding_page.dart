import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/depending_data/dropdown_list.dart';
import 'package:first_project/depending_data/snacbar.dart';
import 'package:first_project/function/hive_functions/movie_add_functions/movie_add.dart';
import 'package:first_project/function/pop_up.dart';
import 'package:first_project/main.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/adding_button.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/alert_dialog.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/cast_list_view.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/dropdown.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/images_card.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/text.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/text_button_icon.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/movie_add/depending_widgets/text_field.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


// ignore: must_be_immutable
class MoviesAddingPage extends StatelessWidget {
  MoviesAddingPage({super.key});
  ImagePicker imagePicker = ImagePicker();
  ImagePicker imagePicker1 = ImagePicker();
  ValueNotifier<List<String>>? movieImages = ValueNotifier([]);
  final TextEditingController _tittle = TextEditingController();
  final TextEditingController _link = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _points = TextEditingController();
  ValueNotifier<List<String>> castImages = ValueNotifier([]);
  ValueNotifier<List<String>> castNames = ValueNotifier([]);
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String? castPhoto;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bagroundBlack,
      appBar: AppBar(
        backgroundColor: bagroundBlack,
        leading: IconButtonWidget(
          icon: Icons.arrow_back,
          function: () => popUp(context),
        ),
        title:  TextButtonIconWidget(
          label: 'Add New Movie',
          icon: Icons.movie,
          color:textWeight,
          bold: FontWeight.w900,
        ),
      ),
      body: SingleChildScrollView(
       
            child:  Form(
              key: _globalKey,
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Movie Photos Section
                  TextAddingWidget(
                    width: width,
                    text: 'Movie Photos',
                  ),
                  PickingMovieImagesWidget(
                    movieImages: movieImages,
                    height: height,
                    width: width,
                    imagePicker: imagePicker,
                  ),
                  // Movie Title
                  AddingPageTextFormStyle(
                    hint: 'Movie Title',
                    label: 'Movie Title',
                    icon: Icons.title,
                    controller: _tittle,
                    validation: (value) => value == null || value.isEmpty,
                    textForValidatoin: 'Please enter title',
                  ),
                  // Genre and Language Dropdown
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormFieldWidget(
                          selectedItem: selectedGenre,
                          catogary: 'Genre',
                          items: genre,
                          paddingH: 0.028,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormFieldWidget(
                          selectedItem: selectedLanguage,
                          catogary: 'Language',
                          items: language,
                          paddingH: 0.028,
                        ),
                      ),
                    ],
                  ),
                  // Trailer Link
                  AddingPageTextFormStyle(
                    controller: _link,
                    validation: (value) => RegExp(
                            r'^(https?:\/\/)?([a-zA-Z0-9]+\.[a-zA-Z]{2,})([\/\w .-]*)*\/?$')
                        .hasMatch(value),
                    textForValidatoin: 'Please enter a valid URL',
                    hint: 'Trailer Link',
                    label: 'Trailer Link',
                    icon: Icons.link,
                  ),
                  // Movie Description
                  AddingPageTextFormStyle(
                    hint: 'Movie Description',
                    validation: (value) => value == null || value.isEmpty,
                    controller: _description,
                    label: 'Movie Description',
                    textForValidatoin: 'Please enter Description',
                    icon: Icons.description,
                    maxLine: 5,
                  ),
                  // Character Points
                  AddingPageTextFormStyle(
                    hint: 'Overview about the movie',
                    validation: (value) => value == null || value.isEmpty,
                    controller: _points,
                    label: 'Overview about the movie',
                    textForValidatoin: 'c',
                    icon: Icons.person_outlined,
                    maxLine: 5,
                  ),
                  // Cast List Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextAddingWidget(
                        width: width,
                        text: 'Cast List',
                      ),
                      ButtonInAdding(
                        // ignore: deprecated_member_use
                        height: 0.045,bagroundColor: isDark.value? Colors.grey[900]:Colors.grey.withOpacity(0.5),
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
                          ),
                        ),
                      ),
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
                  // Add Button
                  // ignore: deprecated_member_use
                  ButtonInAdding(bagroundColor:isDark.value? Colors.grey[900]:Colors.grey.withOpacity(0.5),
                      height: 0.06,
                      width: width,text: 'Add Movie',
                      function: () {
                        if (_globalKey.currentState!.validate()) {
                          addIntoDb(context);
                        }
                      }),
                  SizedBox(
                    height: height * 0.01,
                  )
                ],
              ),
            )
          
        ),
      );
   
  }

  addIntoDb(BuildContext context) async {
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
      // ignore: await_only_futures
      final value = await MovieModel(
        tittle: title,
        genre: selectedGenre.value,
        language: selectedLanguage.value,
        link: link,
        description: description,
        points: points,
        castImages: castImages.value,
        castNames: castNames.value,
        movieImages: movieImages!.value,
        rating: 0,
      );
      movieAdd(value);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop({'id': value.id});
      // ignore: unused_local_variable
      DateTime currentTime = DateTime.now();
      SnackBarFunction(
          // ignore: use_build_context_synchronously
          context: context,
          text: '"Movie added successfully!"',
          color: Colors.green);
    }
  }
}
