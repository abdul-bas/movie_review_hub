import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/settings/controller/controller.dart';
import 'package:first_project/ui/settings/widgets/chevron_icon.dart';
import 'package:first_project/ui/settings/widgets/icon_badge.dart';
import 'package:first_project/ui/settings/widgets/label_column.dart';
import 'package:flutter/material.dart';


class SettingCard extends StatelessWidget {
  const SettingCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  final SettingItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppColors.cardRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppColors.cardRadius),
        splashColor: AppColors.accent.withValues(alpha:  0.08),
        highlightColor: AppColors.accent.withValues(alpha:  0.04),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border, width: 1),
            borderRadius: BorderRadius.circular(AppColors.cardRadius),
          ),
          child: Row(
            children: [
              SettingsIconBadge(icon: item.icon),
              const SizedBox(width: 14),
              Expanded(child: SettingsLabelColumn(item: item)),
              const SettingsChevronIcon(),
            ],
          ),
        ),
      ),
    );
  }
}

