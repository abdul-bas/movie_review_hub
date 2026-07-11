
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/routes/top_push_replacement.dart';
import 'package:first_project/ui/settings/controller/controller.dart';
import 'package:first_project/ui/settings/widgets/card.dart';
import 'package:first_project/routes/center_push.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static final _controller = SettingsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon:  Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.onSurface,
          size: 20,
        ),
      ),
      title:  Text(
        'Settings',
        style: TextStyle(
          color: AppColors.onSurface,
          fontSize: 22,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
        ),
      ),
      bottom:  PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(color: AppColors.divider, height: 1),
      ),
    ),
      body:  ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: _controller.items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) => SettingCard(
        item: _controller.items[index],
        onTap: () => navigateFromTopPushReplacement(
           context,
       _controller.items[index].route,
        ),
      ),
    )
    );
  }

}