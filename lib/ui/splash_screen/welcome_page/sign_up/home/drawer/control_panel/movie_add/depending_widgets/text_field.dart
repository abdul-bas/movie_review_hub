import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/file_structure/ui/auth/welcome_screen/Welcome_Page.dart';
import 'package:flutter/material.dart';



class SizedBoxWidget extends StatelessWidget {
  const SizedBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.015,
    );
  }
}

class AddingPageTextFormStyle extends StatelessWidget {
  const AddingPageTextFormStyle(
      {super.key, this.hint, this.icon, this.label, this.maxLine,this.controller,this.textForValidatoin,this.validation});
  final IconData? icon;
  final String? hint;
  final String? label;
  final int? maxLine;
  final dynamic controller;
  final dynamic validation;
  final String? textForValidatoin;
  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      iconColor: textWeight,
      prefixicon: icon,
      height: 0.066,
      filled: true,
      // ignore: deprecated_member_use
      filledColor: Colors.grey.withOpacity(0.1),
      radius: 12,
      paddingH: 0.028,
      hint: hint,labelColor: textWeight,
      hintColor: textWeight,
      focusBorderColor:opendcityWhite,
      labelText: label,
      maxLine: maxLine,
      controller:controller ,
      validation:validation ,textForValidatoin: textForValidatoin,
    );
  }
}
