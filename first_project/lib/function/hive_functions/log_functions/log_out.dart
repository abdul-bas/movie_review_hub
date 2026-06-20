import 'package:first_project/model/sign_up_model.dart';
import 'package:first_project/file_structure/ui/auth/welcome_screen/Welcome_Page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';



Future<void> logOut(String id,BuildContext context) async {
  final db = await Hive.openBox<SignUpModel>('signUp');

  
  final model = db.get(id);

  if (model != null) {
   
    model.isLog = false;

  
    await db.put(id, model);
     // ignore: use_build_context_synchronously
     Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const WelcomePage()),(route)=>false);
  } else {
  }
}

