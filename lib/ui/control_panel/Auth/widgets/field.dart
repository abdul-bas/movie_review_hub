
import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AdminField extends StatelessWidget {
  const AdminField({super.key, 
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.obscure = false,
    required this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final bool obscure;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator,
      style:  TextStyle(color: AppColors.onSurface, fontSize: 15),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle:  TextStyle(color: AppColors.onSurfaceSubtle, fontSize: 13),
        hintStyle:  TextStyle(color: AppColors.onSurfaceSubtle),
        prefixIcon: Icon(icon, color: AppColors.onSurfaceSubtle, size: 20),
        filled: true,
        fillColor: AppColors.inputFill,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
          borderSide:
              const BorderSide(color: AppColors.inputFocusedBorder, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppColors.fieldRadius),
          borderSide: BorderSide(color: Colors.red.shade700),
        ),
      ),
    );
  }
}