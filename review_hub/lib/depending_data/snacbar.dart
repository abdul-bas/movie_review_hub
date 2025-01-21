 import 'package:flutter/material.dart';
import 'package:review_hub/widget/text_widget.dart';


// ignore: non_constant_identifier_names
SnackBarFunction({required BuildContext context, required String text, Color color = Colors.black}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: color,
            content: TextWidget(
              
                text:
                    text)));
}