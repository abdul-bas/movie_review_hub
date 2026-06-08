 import 'package:first_project/widget/text_widget.dart';
import 'package:flutter/material.dart';


// ignore: non_constant_identifier_names
SnackBarFunction({required BuildContext context, required String text, Color color = Colors.black}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: color,
            content: TextWidget(
              
                text:
                    text)));
}