import 'package:first_project/core/database/movie_oprations/get_movie.dart';
import 'package:first_project/model/movie_model.dart';


MovieModel featch({required String id}) {
  final data = movieDetailes.value.firstWhere(
    (element) => element.id == id,
  );
  getMovie();
  return data;
}

