 import 'package:first_project/ui/common/text_widget.dart';
import 'package:flutter/material.dart';


void snackBarFunction({required BuildContext context, required String text, Color color = Colors.black}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: color,
            content: TextWidget(
              
                text:
                    text)));
}