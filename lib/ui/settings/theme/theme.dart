import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/core/theme/app_theme.dart';
import 'package:first_project/ui/settings/controller/controller.dart';

import 'package:flutter/material.dart';

class ThemeSettingsScreen extends StatefulWidget {
  const ThemeSettingsScreen({super.key});

  static final _controller = SettingsController();

  @override
  State<ThemeSettingsScreen> createState() => _ThemeSettingsScreenState();
}

class _ThemeSettingsScreenState extends State<ThemeSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon:  Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.onSurface,
            size: 20,
          ),
        ),
        title:  Text(
          'Theme Settings',
          style: TextStyle(
            color: AppColors.onSurface,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottom:  PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: AppColors.divider, height: 1),
        ),
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: isDark,
        builder: (context, isDarkMode, _) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppColors.cardRadius),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  children: [
                    Icon(
                      ThemeSettingsScreen._controller.currentThemeIcon(isDarkMode),
                      size: 48,
                      color: AppColors.accent,
                    ),
                    const SizedBox(height: 14),
                     Text(
                      'Currently Using',
                      style: TextStyle(
                        color: AppColors.onSurfaceSubtle,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      ThemeSettingsScreen._controller.currentThemeLabel(isDarkMode),
                      style:  TextStyle(
                        color: AppColors.onSurface,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ...ThemeOption.values.map((option) {
                final isSelected =
                    ThemeSettingsScreen._controller.isThemeSelected(option, isDarkMode);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                         ThemeSettingsScreen._controller.applyTheme(option.isDark);
                         setState(() {
                           
                         });
                      },
                      borderRadius: BorderRadius.circular(AppColors.cardRadius),
                      splashColor: AppColors.accent.withValues(alpha: 0.08),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.accent.withValues(alpha: 0.1)
                              : AppColors.surface,
                          borderRadius:
                              BorderRadius.circular(AppColors.cardRadius),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.accent
                                : AppColors.border,
                            width: isSelected ? 1.5 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              option.icon,
                              color: isSelected
                                  ? AppColors.accent
                                  : AppColors.onSurfaceSubtle,
                              size: 22,
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                option.label,
                                style: TextStyle(
                                  color: isSelected
                                      ? AppColors.onSurface
                                      : AppColors.onSurfaceSubtle,
                                  fontSize: 15,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                            if (isSelected)
                              const Icon(
                                Icons.check_circle_rounded,
                                color: AppColors.accent,
                                size: 20,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(AppColors.cardRadius),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Icon(Icons.info_outline_rounded,
                        color: AppColors.onSurfaceSubtle, size: 16),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        ThemeSettingsScreen._controller.themeDescription(isDarkMode),
                        style:  TextStyle(
                          color: AppColors.onSurfaceSubtle,
                          fontSize: 13,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
