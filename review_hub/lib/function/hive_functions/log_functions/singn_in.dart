import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/depending_data/snacbar.dart';
import 'package:review_hub/model/sign_up_model.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/home_page.dart';
import 'package:review_hub/widget/text_widget.dart';

Future<void> signIn(String email, String password,BuildContext context) async {
  // ignore: no_leading_underscores_for_local_identifiers
  final _db = await Hive.openBox<SignUpModel>('signUp');
  
     try{
      // ignore: await_only_futures
      final model = await _db.values
      .firstWhere((e) => e.email == email && e.password == password);
      model.isLog = true;
  _db.put(model.id, model);
  // ignore: use_build_context_synchronously
  Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage(id: model.id!)),(route)=>false);
          SnackBarFunction(
          // ignore: use_build_context_synchronously
          context: context,
          text: 'Signin successful! Welcome Again.',
          color: Colors.green);
     }catch(e){
  // ignore: use_build_context_synchronously
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: TextWidget(text: 'Invalid email or password.',color: textWeight,),
      duration: const Duration(seconds: 3),),
    );
     }
  
      

      
}
