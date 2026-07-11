import 'package:first_project/core/theme/app_theme.dart';
import 'package:first_project/ui/settings/help_and_support/help_and_support.dart';
import 'package:first_project/ui/settings/privacy_and%20_permission/privacy_and_permission.dart';
import 'package:first_project/ui/settings/theme/theme.dart';

import 'package:flutter/material.dart';

class SettingItem {
  const SettingItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.route,
  });

  final String title;
  final String description;
  final IconData icon;
  final Widget route;
}

class HelpSection {
  const HelpSection({
    required this.heading,
    required this.body,
    required this.bullets,
  });

  final String heading;
  final String body;
  final List<String> bullets;
}

class PrivacyContent {
  const PrivacyContent({
    required this.intro,
    required this.sectionTitle,
    required this.sectionBody,
    required this.bullets,
    required this.footer,
  });

  final String intro;
  final String sectionTitle;
  final String sectionBody;
  final List<String> bullets;
  final String footer;
}

enum ThemeOption {
  dark(true, Icons.dark_mode, 'Dark Theme'),
  light(false, Icons.light_mode, 'Light Theme');

  final bool isDark;
  final IconData icon;
  final String label;

  const ThemeOption(this.isDark, this.icon, this.label);
}

class SettingsController {
  const SettingsController();

  List<SettingItem> get items =>  [
        SettingItem(
          title: 'Privacy and Permissions',
          description: 'Manage app permissions and privacy settings',
          icon: Icons.security_outlined,
          route: PrivacyScreen(),
        ),
        SettingItem(
          title: 'Help and Support',
          description: 'Get help and contact support',
          icon: Icons.help_outline_rounded,
          route: HelpAndSupportScreen(),
        ),
        SettingItem(
          title: 'Theme',
          description: 'Customize app appearance',
          icon: Icons.palette_outlined,
          route: ThemeSettingsScreen(),
        ),
      ];

  List<HelpSection> get helpSections => const [
        HelpSection(
          heading: 'Getting Help',
          body:
              'If you encounter any issues or have questions while using the app, '
              'here are some quick ways to get help:',
          bullets: [
            'Frequently Asked Questions (FAQ): Check our FAQ section for answers to commonly '
                'asked questions. Whether you\'re facing login issues, need help managing your '
                'watchlist, or want to understand our app\'s features better, the FAQ is a great '
                'place to start.',
            'Tutorials and Guides: Access step-by-step tutorials and guides on using features, '
                'managing settings, and personalizing your experience within the app.',
          ],
        ),
        HelpSection(
          heading: 'Contacting Support',
          body:
              'Still need assistance? Our support team is here to help! You can reach us '
              'through the following options:',
          bullets: [
            'Email Support: Send us an email at [support email address]. Our team typically '
                'responds within 24 hours on business days.',
            'In-App Chat: Use our in-app chat for real-time support on app features, settings, '
                'or troubleshooting common issues.',
            'Feedback and Suggestions: We love hearing from our users! Use the feedback option '
                'to share your thoughts, suggestions, or report issues. Your feedback helps us '
                'improve the app and bring new features to you.',
          ],
        ),
      ];

  PrivacyContent get privacyContent => const PrivacyContent(
        intro:
            'In the Privacy section of your app, it\'s important to reassure users about '
            'how their data and privacy are protected.',
        sectionTitle: 'About This App',
        sectionBody:
            'Welcome to CriticHub, where we bring you a tailored movie experience with '
            'personalized recommendations, reviews, and ratings for your favorite films! '
            'We value your privacy and are committed to protecting any information you share '
            'with us. Here\'s a brief overview of how we handle your data:',
        bullets: [
          'Data Collection: We collect minimal information, such as preferences and watch history, '
              'only to enhance your movie recommendations and improve the app experience. We do not '
              'collect or store any personal data without your consent.',
          'Permissions: The permissions we request, like access to your camera and location, are '
              'only used to enhance features within the app. For instance, location access helps us '
              'offer location-based content suggestions. All permissions are optional, and you can '
              'disable them anytime in the settings.',
          'Data Sharing: We do not sell or share your data with third parties. Any data we collect '
              'is solely used to provide you with a better experience within the app.',
          'Security: We use industry-standard practices to protect your data and ensure that your '
              'information remains safe and secure.',
        ],
        footer:
            'If you have any questions about our privacy practices, please feel free to '
            'contact our support team. We are here to help and ensure you have a secure, '
            'enjoyable experience using CriticHub.',
      );

  String currentThemeLabel(bool isDarkMode) =>
      isDarkMode ? 'Dark Theme' : 'Light Theme';

  IconData currentThemeIcon(bool isDarkMode) =>
      isDarkMode ? Icons.dark_mode : Icons.light_mode;

  String themeDescription(bool isDarkMode) => isDarkMode
      ? 'Dark theme helps reduce eye strain in low-light conditions'
      : 'Light theme provides better visibility in bright environments';

  bool isThemeSelected(ThemeOption option, bool isDarkMode) =>
      isDarkMode == option.isDark;

  void applyTheme(bool value) {
    isDark.value = value;
    isDark.notifyListeners();
  }
}
