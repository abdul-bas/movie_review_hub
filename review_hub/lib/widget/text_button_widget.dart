import 'package:flutter/material.dart';
import 'package:review_hub/depending_data/navigations.dart';
import 'package:review_hub/widget/text_widget.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget(
      {super.key,
      required this.text,
      this.function,
      this.navigation,
      this.formKey,
      this.validateFunction,
      this.backgroundColor,
      this.size,
      this.width,
      this.height,this.textColor,this.bold});
  final String text;
  final Function()? function;
  final Widget? navigation;
  final Function()? validateFunction;
  final dynamic backgroundColor;
  final double? height;
  final GlobalKey<FormState>? formKey;
  final double? size;
  final double? width;
  final dynamic textColor;
  final dynamic bold;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
          style: ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              backgroundColor: WidgetStatePropertyAll(backgroundColor)),
          onPressed: () {
            if (validateFunction != null && formKey != null) {
              final formState = formKey!.currentState;
              if (formState != null && formState.validate()) {
                validateFunction!();
              }
              formKey!.currentState!.validate();
            } else if (navigation != null) {
              navigateFromBottom(context, navigation!);
            } else if (function != null) {
              function!();
            }
          },child: FittedBox(fit: BoxFit.scaleDown,
            child: TextWidget(text: text,color: textColor,bold: bold,size: size,)),),
    );
  }
}
