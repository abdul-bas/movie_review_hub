import 'package:hive_flutter/hive_flutter.dart';
part 'movie_model.g.dart';

@HiveType(typeId: 2)
class MovieModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
   List<String>? userId;
  @HiveField(2)
  List< Map<String,dynamic>>? comment;
  @HiveField(3)
  final String tittle;
  @HiveField(4)
  final String genre;
  @HiveField(5)
  final String language;
  @HiveField(6)
  final String link;
  @HiveField(7)
  final String description;
  @HiveField(8)
  final String points;
  @HiveField(9)
  final List<String> movieImages;
  @HiveField(10)
  final List<String> castImages;
  @HiveField(11)
  final List<String> castNames;
  @HiveField(12)
  double? rating;
  MovieModel(
      {this.id,
      this.userId,
      this.comment,
      required this.tittle,
      required this.genre,
      required this.language,
      required this.link,
      required this.description,
      required this.points,
      required this.castImages,
      required this.castNames,
      required this.movieImages,this.rating});
}
