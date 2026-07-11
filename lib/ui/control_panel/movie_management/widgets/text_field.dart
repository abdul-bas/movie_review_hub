import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';



class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.icon,
    this.maxLines = 1,
    this.validator,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String label;
  final String? hint;
  final IconData? icon;
  final int maxLines;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style:  TextStyle(color: AppColors.onSurface, fontSize: 15),
      cursorColor: AppColors.accent,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle:  TextStyle(color: AppColors.onSurfaceSubtle, fontSize: 14),
        hintStyle:  TextStyle(color: AppColors.onSurfaceSubtle, fontSize: 14),
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.only(left: AppColors.space4, right: AppColors.space4),
                child: Icon(icon, color: AppColors.onSurfaceSubtle, size: 20),
              )
            : null,
        filled: true,
        fillColor: AppColors.inputFill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppColors.space16,
          vertical: AppColors.space16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppColors.fieldRadius),
          borderSide:  BorderSide(color: AppColors.inputBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppColors.fieldRadius),
          borderSide:  BorderSide(color: AppColors.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppColors.fieldRadius),
          borderSide: const BorderSide(color: AppColors.inputFocusedBorder, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppColors.fieldRadius),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppColors.fieldRadius),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
        errorStyle: const TextStyle(color: AppColors.error, fontSize: 12),
      ),
    );
  }
}