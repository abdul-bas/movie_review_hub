import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.icon,
    this.function,
    this.size,
    this.color,
    this.backgroundColor,
  });

  final IconData icon;
  final Function()? function;
  final double? size;
  final dynamic color;
  final dynamic backgroundColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? Colors.white.withValues(alpha:  0.07),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        minimumSize: const WidgetStatePropertyAll(Size(40, 40)),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
        overlayColor: WidgetStatePropertyAll(
          Colors.white.withValues(alpha:  0.08),
        ),
      ),
      onPressed: () => function?.call(),
      icon: Icon(
        icon,
        color: color ??AppColors. textWeight,
        size: size ?? 20,
      ),
    );
  }
}
