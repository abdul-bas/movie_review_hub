import 'package:flutter/material.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/depending_data/navigations.dart';
import 'package:review_hub/main.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/settings/help_and_support/help_and_support.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/settings/privacy_and%20_permission/privacy_and_permission.dart';
import 'package:review_hub/ui/splash_screen/welcome_page/sign_up/home/drawer/settings/theme/theme.dart';


class SettingsMenu extends StatelessWidget {
  SettingsMenu({super.key});

  final List<SettingItem> settingItems = [
    SettingItem(
      title: 'Privacy and Permissions',
      icon: Icons.security_outlined,
      route: const Privacy_and_permissions(),
      description: 'Manage app permissions and privacy settings',
    ),
    SettingItem(
      title: 'Help and Support',
      icon: Icons.help_outline_rounded,
      route: const Help_and_Support(),
      description: 'Get help and contact support',
    ),
    SettingItem(
      title: 'Theme',
      icon: Icons.palette_outlined,
      route: const ThemeSettings(),
      description: 'Customize app appearance',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDark,
      builder: (context, isDarkMode, _) {
        return Scaffold(
          backgroundColor: bagroundBlack,
          appBar: AppBar(
            backgroundColor: bagroundBlack,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: textWeight,
                size: 22,
              ),
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                color: textWeight,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: settingItems.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = settingItems[index];
              return _buildSettingCard(context, item, isDarkMode);
            },
          ),
        );
      },
    );
  }

  Widget _buildSettingCard(BuildContext context, SettingItem item, bool isDarkMode) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: isDarkMode ? Colors.grey[900] : Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () =>navigateFromCenter(context: context, navigation: item.route),
        
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDarkMode 
                      ? Colors.grey[800]
                      // ignore: deprecated_member_use
                      : Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  item.icon,
                  color: textWeight,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.description,
                      style: TextStyle(
                        color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: isDarkMode ? Colors.grey[600] : Colors.grey[400],
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingItem {
  final String title;
  final String description;
  final IconData icon;
  final Widget route;

  SettingItem({
    required this.title,
    required this.icon,
    required this.route,
    required this.description,
  });
}