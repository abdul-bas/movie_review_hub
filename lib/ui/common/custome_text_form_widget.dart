
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/routes/side_push.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
      this.radius,
      this.height,
      this.width,
      this.textColor,
      this.filled,
      this.hint,
      this.hintColor,
      this.readOnly,
      this.filledColor,
      this.navigation,
      this.paddingH,
      this.controller,
      this.paddingV,
      this.validation,
      this.textForValidatoin,
      this.shadow,
      this.prefixicon,
      this.sufix,
      this.iconColor,
      this.labelText,
      this.focusBorderColor,
      this.maxLine,
      this.onTap,
      this.sufixIcon,
      this.onChanged,
      this.labelColor});
  final double? height;
  final double? width;
  final double? radius;
  final dynamic textColor;
  final dynamic filledColor;
  final bool? filled;
  final bool? readOnly;
  final String? hint;
  final dynamic hintColor;
  final Widget? navigation;
  final double? paddingH;
  final double? paddingV;
  final dynamic controller;
  final dynamic validation;
  final String? textForValidatoin;
  final bool? shadow;
  final IconData? prefixicon;
  final Widget? sufix;
  final String? labelText;
  final dynamic iconColor;
  final dynamic focusBorderColor;
  final int? maxLine;
  final Function()? onTap;
  final Function(String)? onChanged;
  final IconData? sufixIcon;
  final dynamic labelColor;
  @override
  Widget build(BuildContext context) {
    final mdqHeight = MediaQuery.of(context).size.height;
    final mdqWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: maxLine == null
          ? height != null
              ? mdqHeight * height!
              : null
          : null,
      width: width != null ? mdqWidth * width! : null,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: paddingH != null ? mdqWidth * paddingH! : 0,
            vertical: paddingV != null ? mdqHeight * paddingV! : 0),
        child: TextFormField(
          maxLines: maxLine,
          controller: controller,
          onTap: () {
            if (navigation != null) {
              navigateFromSide(context, navigation!);
            } else if (onTap != null) {
              onTap!();
            }
          },
          onChanged: (value) {
            if (onChanged != null) {
              onChanged!(value);
            }
          },
          readOnly: readOnly ?? false,
          style: TextStyle(color: textColor, shadows: [
            shadow != null
                ? Shadow(
                    offset: const Offset(3.0, 5.0),
                    blurRadius: 4.0,
                    // ignore: deprecated_member_use
                    color: Colors.grey.withOpacity(0.9),
                  )
                : const Shadow(),
          ]),
          // ignore: unnecessary_null_in_if_null_operators
          decoration: InputDecoration(
              // ignore: unnecessary_null_in_if_null_operators
              suffixIcon: Icon(sufixIcon ?? null),
              labelText: labelText,
              floatingLabelStyle: TextStyle(color: labelColor),
              prefixIconColor: iconColor,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2, color: focusBorderColor ?? AppColors.textWeight),
                  borderRadius: BorderRadius.circular(radius ?? 0)),
              prefixIcon: prefixicon != null ? Icon(prefixicon) : null,
              // ignore: prefer_if_null_operators
              suffix: sufix != null ? sufix : null,
              hintText: hint,
              hintStyle: TextStyle(color: hintColor),
              labelStyle:
                  TextStyle(color: labelColor, fontWeight: FontWeight.w900),
              filled: filled,
              fillColor: filledColor,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 0))),
          validator: (value) {
            if (validation != null) {
              if (value!.isEmpty) {
                return 'Please enter your $hint';
              } else if (validation(value)) {
                // ignore: prefer_if_null_operators
                return textForValidatoin != null
                    ? textForValidatoin
                    : 'Password must be at least 6 characters long';
              }
            }
            return null;
          },
        ),
      ),
    );
  }
}
