import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/settings/controller/controller.dart';
import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
   PrivacyScreen({super.key});

  static final _controller = SettingsController();

  @override
  Widget build(BuildContext context) {
    final content = _controller.privacyContent;
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
          'PRIVACY AND PERMISSIONS',
          style: TextStyle(
            color: AppColors.onSurface,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        bottom:  PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: AppColors.divider, height: 1),
        ),
      ),
      body: ListView(
        padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          Text(
            content.intro,
            style:  TextStyle(
              color: AppColors.onSurfaceSubtle,
              fontSize: 15,
              height: 1.6,
            ),
          ),
           SizedBox(height: 24),
          Text(
            content.sectionTitle,
            style:  TextStyle(
              color: AppColors.onSurface,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
          ),
           SizedBox(height: 8),
          Container(
            width: 36,
            height: 3,
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
           SizedBox(height: 12),
          Text(
            content.sectionBody,
            style:  TextStyle(
              color: AppColors.onSurfaceSubtle,
              fontSize: 15,
              height: 1.6,
            ),
          ),
           SizedBox(height: 16),
          ...content.bullets.map((b) => Padding(
      padding:  EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 7),
            child: Container(
              width: 6,
              height: 6,
              decoration:  BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
              ),
            ),
          ),
           SizedBox(width: 12),
          Expanded(
            child: Text(
              b,
              style:  TextStyle(
                color: AppColors.onSurface,
                fontSize: 14,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    )),
           SizedBox(height: 24),
          Container(
            padding:  EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppColors.cardRadius),
              border: Border.all(color: AppColors.border),
            ),
            child: Text(
              content.footer,
              style:  TextStyle(
                color: AppColors.onSurfaceSubtle,
                fontSize: 14,
                height: 1.6,
              ),
            ),
          ),
           SizedBox(height: 20),
        ],
      ),
    );
  }
}
