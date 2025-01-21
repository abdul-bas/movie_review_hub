

import 'package:review_hub/depending_data/navigations.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/control_panel/edit/movie_edit.dart';

nullChek({context,value}){
   if (value != null) {
      navigateFromSde(context, MovieEdit(id: value!));
    } else {
      // Handle the null case
      // Optionally show a user-friendly message or fallback behavior
    }

}