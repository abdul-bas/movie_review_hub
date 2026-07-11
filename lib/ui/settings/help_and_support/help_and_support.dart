import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/settings/controller/controller.dart';
import 'package:flutter/material.dart';

class HelpAndSupportScreen extends StatelessWidget {
   const HelpAndSupportScreen({super.key});

  static final _controller = SettingsController();

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
          'HELP AND SUPPORT',
          style: TextStyle(
            color: AppColors.onSurface,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        bottom:  PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: AppColors.divider, height: 1),
        ),
      ),
      body: ListView.builder(
          padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          itemCount: _controller.helpSections.length,
          itemBuilder: (_, index) {
            final section = _controller.helpSections[index];
            return Padding(
              padding:  EdgeInsets.only(bottom: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  Text(
                    section.heading,
                    style:  TextStyle(
                      color: AppColors.onSurface,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                   SizedBox(height: 8),
                  // Divider accent
                  Container(
                    width: 36,
                    height: 3,
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                   SizedBox(height: 12),
                  // Body
                  Text(
                    section.body,
                    style:  TextStyle(
                      color: AppColors.onSurfaceSubtle,
                      fontSize: 15,
                      height: 1.6,
                    ),
                  ),
                   SizedBox(height: 12),
                  // Bullets
                  ...section.bullets.map((b) => Padding(
                        padding:  EdgeInsets.only(left: 4, bottom: 10),
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
                ],
              ),
            );
          }),
    );
  }
}
