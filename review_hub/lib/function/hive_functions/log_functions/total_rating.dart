import 'package:hive_flutter/adapters.dart';
import 'package:review_hub/model/movie_model.dart';
import 'package:review_hub/model/sign_up_model.dart';


Future<void> totalRating({required String movieId}) async {
  int totalRating = 0;
  int totalUsers = 0;

  // ignore: no_leading_underscores_for_local_identifiers
  final _dbSignUp = await Hive.openBox<SignUpModel>('signUp');
  
 
  for (var user in _dbSignUp.values) {
    // ignore: unnecessary_null_comparison
    if (user.index != null && user.index.containsKey(movieId)) {
      totalRating += user.index[movieId]!;
      totalUsers++;
    }
  }

  if (totalUsers == 0) {
    return;
  }

 
  double intoPercentage = (totalRating / (totalUsers * 5)) * 5;
   intoPercentage = double.parse(intoPercentage.toStringAsFixed(1)); // R

 
  // ignore: no_leading_underscores_for_local_identifiers
  final _dbMovie = await Hive.openBox<MovieModel>('movie');

 
  final movieKey = _dbMovie.keys.firstWhere(
    (key) => _dbMovie.get(key)?.id == movieId,
    orElse: () => null,
  );

  if (movieKey == null) {
    // ignore: avoid_print
    print("Movie not found for ID: $movieId");
    return;
  }

  final movieModel = _dbMovie.get(movieKey);
  if (movieModel != null) {
   
    movieModel.rating = intoPercentage;

    
    await _dbMovie.put(movieKey, movieModel);
    // ignore: avoid_print
    print("Updated rating for movie: $movieId to $intoPercentage%");
  }
}
