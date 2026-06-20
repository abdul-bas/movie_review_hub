import 'package:flutter/material.dart';

List<String> language = ['Malayalam', 'Hindi', 'Tamil','English','Kannada','Urdu','Marati','Telungu',];
ValueNotifier<String> selectedLanguage = ValueNotifier('Malayalam');
List<String> genre= ['Comedy','Horror','Thriller','Fantecy','Action'];
ValueNotifier<String> selectedGenre = ValueNotifier('Comedy');