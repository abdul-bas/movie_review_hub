import 'package:flutter/material.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/main.dart';

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Theme Settings',
          style: TextStyle(
            color: textWeight,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: isDark,
        builder: (context, isDarkMode, _) {
          return Column(
            children: [
              const SizedBox(height: 20),
              // Theme preview card
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[850] : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(
                      isDarkMode ? Icons.dark_mode : Icons.light_mode,
                      size: 48,
                      color: isDarkMode ? Colors.blue[200] : Colors.orange,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Currently Using',
                      style: TextStyle(
                        color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isDarkMode ? 'Dark Theme' : 'Light Theme',
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Theme options
              ...ThemeOption.values.map((theme) => _buildThemeOption(
                    context: context,
                    theme: theme,
                    isDarkMode: isDarkMode,
                  )),
              const SizedBox(height: 20),
              // Theme description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  isDarkMode 
                      ? 'Dark theme helps reduce eye strain in low-light conditions'
                      : 'Light theme provides better visibility in bright environments',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildThemeOption({
    required BuildContext context,
    required ThemeOption theme,
    required bool isDarkMode,
  }) {
    final isSelected = isDarkMode == theme.isDark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => isDark.value = theme.isDark,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected
                  // ignore: deprecated_member_use
                  ? (isDarkMode ? Colors.blue.withOpacity(0.2) : Colors.blue[50])
                  : (isDarkMode ? Colors.grey[900] : Colors.grey[100]),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected 
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  theme.icon,
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : (isDarkMode ? Colors.white70 : Colors.black87),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    theme.label,
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black87,
                      fontSize: 16,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                if (isSelected)
                  Icon(
                    Icons.check_circle,
                    color: Theme.of(context).primaryColor,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum ThemeOption {
  dark(true, Icons.dark_mode, 'Dark Theme'),
  light(false, Icons.light_mode, 'Light Theme');

  final bool isDark;
  final IconData icon;
  final String label;

  const ThemeOption(this.isDark, this.icon, this.label);
}