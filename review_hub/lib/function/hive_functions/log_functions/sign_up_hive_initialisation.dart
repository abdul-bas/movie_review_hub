import 'package:hive_flutter/hive_flutter.dart';
import 'package:review_hub/model/movie_model.dart';
import 'package:review_hub/model/sign_up_model.dart';


initFunction() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(SignUpModelAdapter().typeId)) {
    Hive.registerAdapter(SignUpModelAdapter());
  }
  if (!Hive.isAdapterRegistered(MovieModelAdapter().typeId)) {
    Hive.registerAdapter(MovieModelAdapter());
  }
}
