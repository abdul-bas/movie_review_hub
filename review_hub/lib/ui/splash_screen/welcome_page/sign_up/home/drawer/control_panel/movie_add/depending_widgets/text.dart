import 'package:flutter/material.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/widget/text_widget.dart';


class TextAddingWidget extends StatelessWidget {
  const TextAddingWidget({super.key, required this.width, required this.text});

  final double width;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextWidget(
      paddingV: 0.005,
      paddingH: width * 0.00005,
      text: text,
      color: textWeight,
      size: 16,
      bold: FontWeight.w600,
      
    );
  }
}