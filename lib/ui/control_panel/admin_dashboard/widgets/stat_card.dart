import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';


class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.icon,
    required this.count,
    required this.label,
  });

  final IconData icon;
  final String count;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        gradient:  LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
           AppColors.surface,
          AppColors.surfaceElevated
          ],
        ),
        borderRadius: BorderRadius.circular(AppColors.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha:  0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: AppColors.accent, size: 20),
              ),
              Icon(Icons.trending_up_rounded,
                  color: AppColors.accent.withValues(alpha:  0.5), size: 16),
            ],
          ),
          const SizedBox(height: 14),
         
          Text(
            count,
            style:  TextStyle(
              color: AppColors.onSurface,
              fontSize: 30,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),
        
          Text(
            label,
            style: TextStyle(
              color: AppColors.onSurfaceSubtle,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}