import 'package:flutter/material.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/widget/text_widget.dart';


class TextButtonIconWidget extends StatelessWidget {
  const TextButtonIconWidget(
      {super.key,
      this.icon,
      required this.label,
      this.color,
      this.bold,
      this.function,this.fontSize,this.iconSize});
  final String label;
  final IconData? icon;
  final dynamic color;
  final FontWeight? bold;
  final Function()? function;
  final dynamic iconSize;
  final dynamic fontSize;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        if (function != null) {
          function!();
        }
      },
      icon: Icon(
        icon,
        color: color ?? textWeight,
        size: iconSize??30,
      ),
      label: TextWidget(
        text: label,
        color: color ?? textWeight,
        size:fontSize?? 20,
        bold: bold,
      ),
    );
  }
}
