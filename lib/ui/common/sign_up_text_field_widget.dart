
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/common/custome_text_form_widget.dart';
import 'package:flutter/material.dart';

class SignUpTextFieldWidget extends StatelessWidget {
  const SignUpTextFieldWidget(
      {super.key,
      required this.hint,
      this.controller,
      this.valdation,
      this.textForValidatoin,
      this.prifixColor,
      this.prifixIcon,
      this.labelText,
      this.labelColor});
  final String hint;
  final dynamic controller;
  final IconData? prifixIcon;
  final dynamic prifixColor;
  final String? labelText;
  // ignore: strict_top_level_inference, prefer_typing_uninitialized_variables
  final valdation;
  final String? textForValidatoin;
  final dynamic labelColor;
  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller,
      hint: hint,
      filled: true,
      filledColor: AppColors.textWeight,
      width: 0.70,
      height: 0.1,
      radius: 5,
      validation: (value) => valdation(value),
      textForValidatoin: textForValidatoin,
      textColor: AppColors.textBlack,
      prefixicon: prifixIcon,
      iconColor: prifixColor,
      labelText: labelText,
      labelColor: labelColor,
      maxLine: 1,
    );
  }
}
