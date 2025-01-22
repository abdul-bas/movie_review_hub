import 'package:first_project/depending_data/dropdown_list.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/widget/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';


// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';


ValueNotifier<List<String>> suggestions = ValueNotifier([]);
ValueNotifier<List<MovieModel>> movies = ValueNotifier([]);
late Box<MovieModel> movieBox; // Declare the box globally

Future<void> initHiveBox() async {
  movieBox = await Hive.openBox<MovieModel>('movie');
  await getMovies();
}

Future<void> getMovies() async {
  movies.value.clear();
  movies.value.addAll(movieBox.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  movies.notifyListeners();
}

Future<void> searchFunction({required String text}) async {
  if (text.isEmpty) {
    suggestionFunction();
    await getMovies();
    return;
  }

  final filteredMovies = movieBox.values.where((element) {
    final matchesTitle =
        element.tittle.toLowerCase().contains(text.toLowerCase());
    final matchesLanguage =
        element.language.toLowerCase().contains(text.toLowerCase());
    final matchesGenre =
        element.genre.toLowerCase().contains(text.toLowerCase());

    return matchesTitle || matchesLanguage || matchesGenre;
  }).toList();

  movies.value.clear();
  movies.value = filteredMovies;
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  movies.notifyListeners();

  final filteredSuggestions = [...language, ...genre]
      .where((element) => element.toLowerCase().contains(text.toLowerCase()))
      .toList();

  suggestions.value = filteredSuggestions;
}

void suggestionFunction() {
  suggestions.value = [...language, ...genre];
}

List<Widget> rowsFunction(
    List<String> currentSuggestions, TextEditingController controller) {
  return [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Wrap(
        alignment: WrapAlignment.start,
        children: currentSuggestions
            .map(
              (item) => TextButtonWidget(
                text: item,
                function: () {
                  controller.text = item;
                  searchFunction(
                      text: item); // Trigger search when suggestion is tapped
                },
              ),
            )
            .toList(),
      ),
    ),
  ];
}

