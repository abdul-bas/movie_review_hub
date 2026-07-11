 import 'package:first_project/ui/home/genre_section/action.dart';
import 'package:first_project/ui/home/genre_section/all.dart';
import 'package:first_project/ui/home/genre_section/comedy.dart';
import 'package:first_project/ui/home/genre_section/fantecy.dart';
import 'package:first_project/ui/home/genre_section/horror.dart';
import 'package:first_project/ui/home/genre_section/thriller.dart';
import 'package:flutter/material.dart';
List<Widget> childNavigation(String id) {
  return [
    All(userId: id),
    Comedy(userId: id),
    Horror(userId: id),
    Thriller(userId: id),
    Fantecy(userId: id),
    ActionScreen(userId: id),
  ];
}