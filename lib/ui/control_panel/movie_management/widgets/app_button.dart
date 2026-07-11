import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.isPrimary = false,
    this.isLoading = false,
    this.expand = false,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  final bool isPrimary;
  final bool isLoading;
  final bool expand;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? (isPrimary ? AppColors.accent : AppColors.surfaceElevated);
    final fg = foregroundColor ?? AppColors.onSurface;

    return SizedBox(
      width: expand ? double.infinity : null,
      height: 48,
      child: TextButton.icon(
        onPressed: isLoading ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(bg),
          foregroundColor: WidgetStatePropertyAll(fg),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: AppColors.space20),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppColors.fieldRadius)),
          ),
          elevation: const WidgetStatePropertyAll(0),
        ),
        icon: isLoading
            ? SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2, color: fg),
              )
            : (icon != null ? Icon(icon, size: 18, color: fg) : const SizedBox.shrink()),
        label: Text(
          label,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: fg),
        ),
      ),
    );
  }
}