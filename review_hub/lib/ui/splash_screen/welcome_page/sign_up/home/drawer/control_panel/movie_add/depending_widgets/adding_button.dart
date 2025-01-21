import 'package:flutter/material.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/widget/text_widget.dart';


class ButtonInAdding extends StatelessWidget {
  const ButtonInAdding(
      {super.key,
      required this.height,
      required this.width,
      this.function,
      this.child,
      this.text,
      this.bagroundColor,
      this.icon,this.textColor});

  final double height;
  final double width;
  final Function()? function;
  final Widget? child;
  final String? text;
  final dynamic bagroundColor;
  final bool? icon;
  // ignore: prefer_typing_uninitialized_variables
  final textColor;
  @override
  Widget build(BuildContext context) {
    final heightes = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return SizedBox(
      height: heightes * height,
      width: widths * width,
      child: TextButton.icon(
          style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(bagroundColor ?? Colors.blue),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
          onPressed: () {
            if (function != null) {
              function!();
            } else if (child != null) {
              child!;
            }
          },
          icon: icon == null
              ? Icon(
                  Icons.add,
                  size: 20,
                  color: textWeight,
                )
              : null,
          label: TextWidget(
            text: text ?? 'Cast List',
            color: textColor?? textWeight,
            size: 15,
          )),
    );
  }
}
