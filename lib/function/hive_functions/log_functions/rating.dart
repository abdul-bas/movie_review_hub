import 'package:first_project/function/hive_functions/log_functions/get_user_db.dart';
import 'package:first_project/function/hive_functions/log_functions/total_rating.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:hive_flutter/adapters.dart';


Future<void> rating({
  required SignUpModel model,
  required String movieid,
  required int indexValue,
}) async {
  // ignore: unnecessary_null_comparison
  if (movieid == null) {
    // ignore: avoid_print
    print('Movie ID is null');
    return;
  } else {
    // ignore: no_leading_underscores_for_local_identifiers
    final _db = await Hive.openBox<SignUpModel>('signUp');

    final key = model.id; 
    if (key == null) {
      // ignore: avoid_print
      print('Error: Model ID is null');
      return;
    }

    
    var storedModel = _db.get(key);

    if (storedModel == null) {
     
      storedModel = SignUpModel(
        fullName: model.fullName,
        password: model.password,
        email: model.email,
        isLog: model.isLog,
        id: model.id,
       
        index: {movieid: indexValue}, 
      );

     
      await _db.put(key, storedModel);
      // ignore: avoid_print
      print('New model created and rating added successfully!');
    } else {
      
     
      storedModel.index =
          storedModel.index; 
      storedModel.index[movieid] = indexValue;

      // ignore: avoid_print
      print('$indexValue rating added for movie: $movieid');
      await _db.put(key, storedModel);
      // ignore: avoid_print
      print('Rating added successfully!');

      // ignore: await_only_futures
      SignUpModel? updatedModel = await _db.get(key);
      if (updatedModel != null) {
        // ignore: avoid_print
        print('${updatedModel.index} updated index');
    
        getUserData();
        totalRating(movieId: movieid);
      }
    }
  }
}
