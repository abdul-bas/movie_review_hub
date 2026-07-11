import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';



class AppDropdownField extends StatelessWidget {
  const AppDropdownField({
    super.key,
    required this.label,
    required this.items,
    required this.selection,
    this.icon = Icons.category_outlined,
  });

  final String label;
  final List<String> items;
  final ValueNotifier<String> selection;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: selection,
      builder: (context, value, _) {
        return DropdownButtonFormField<String>(
          initialValue: items.contains(value) ? value : null,
          isExpanded: true,
          dropdownColor: AppColors.surfaceElevated,
          style:  TextStyle(
            fontSize: 14,
            color: AppColors.onSurface,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: AppColors.onSurfaceSubtle, size: 20),
            labelText: label,
            labelStyle:  TextStyle(fontSize: 14, color: AppColors.onSurfaceSubtle),
            filled: true,
            fillColor: AppColors.inputFill,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppColors.space16,
              vertical: AppColors.space12,
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
          ),
          items: items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item, style:  TextStyle(color: AppColors.onSurface)),
                  ))
              .toList(),
          onChanged: (newValue) {
            if (newValue != null) selection.value = newValue;
          },
        );
      },
    );
  }
}