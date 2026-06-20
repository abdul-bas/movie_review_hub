
import 'package:first_project/file_structure/core/const/app_colors.dart';
import 'package:flutter/material.dart';

class AccountActionCard extends StatelessWidget {
  const AccountActionCard({super.key, 
    required this.icon,
    required this.label,
    required this.onTap,
    this.subtitle,
    this.isDestructive = false,
  });

  final IconData icon;
  final String label;
  final String? subtitle;
  final VoidCallback onTap;
  final bool isDestructive;

  static const Color _destructive = Color(0xFFEF4444);

  @override
  Widget build(BuildContext context) {
    final Color foreground =
        isDestructive ? _destructive : AppColors.onSurface;
    final Color iconBg = isDestructive
        ? _destructive.withValues(alpha: 0.12)
        : AppColors.surfaceElevated;

    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppColors.cardRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppColors.cardRadius),
        splashColor: foreground.withValues(alpha: 0.06),
        highlightColor: foreground.withValues(alpha: 0.03),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppColors.cardRadius),
            border: Border.all(
              color: isDestructive
                  ? _destructive.withValues(alpha: 0.25)
                  : AppColors.divider,
            ),
          ),
          child: Row(
            children: [
            
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: foreground, size: 20),
              ),
              const SizedBox(width: 14),

            
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: foreground,
                        letterSpacing: 0.1,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.onSurfaceSubtle,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

           
              Icon(
                Icons.chevron_right_rounded,
                color: isDestructive
                    ? _destructive.withValues(alpha: 0.6)
                    : AppColors.onSurfaceSubtle,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}