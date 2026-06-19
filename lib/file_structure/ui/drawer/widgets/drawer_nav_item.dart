import 'package:first_project/file_structure/core/const/app_colors.dart';
import 'package:flutter/material.dart';

class DrawerNavItem extends StatelessWidget {
  const DrawerNavItem({super.key, 
    required this.label,
    required this.icon,
    required this.onTap,
    this.accentColor,
    this.indent = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  final Color? accentColor;

  final bool indent;

  @override
  Widget build(BuildContext context) {
    final bool isAccented = accentColor != null;
    final Color foreground = accentColor ?? AppColors.onSurface;

    return Padding(
      padding: EdgeInsets.fromLTRB(indent ? 28 : 8, 1, 8, 1),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          splashColor: foreground.withValues(alpha: 0.08),
          highlightColor: foreground.withValues(alpha: 0.04),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: foreground,
                  size: indent ? 18 : 20,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: indent ? 14 : 15,
                      fontWeight:
                          isAccented ? FontWeight.w700 : FontWeight.w500,
                      color: foreground,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}