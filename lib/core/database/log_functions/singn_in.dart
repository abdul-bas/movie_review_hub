
import 'package:first_project/core/utils/snack_bar/snacbar.dart';
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:first_project/ui/home/home_page.dart';
import 'package:first_project/ui/common/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';


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
          snackBarFunction(
          // ignore: use_build_context_synchronously
          context: context,
          text: 'Signin successful! Welcome Again.',
          color: Colors.green);
     }catch(e){
  // ignore: use_build_context_synchronously
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: TextWidget(text: 'Invalid email or password.',color:AppColors. textWeight,),
      duration: const Duration(seconds: 3),),
    );
     }
  
      

      
}
