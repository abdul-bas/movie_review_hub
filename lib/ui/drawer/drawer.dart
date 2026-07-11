import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/drawer/widgets/drawer_divider.dart';
import 'package:first_project/ui/drawer/widgets/drawer_nav_item.dart';
import 'package:first_project/ui/drawer/widgets/header/header.dart';
import 'package:first_project/ui/drawer/widgets/section_label/section_label.dart';
import 'package:first_project/core/database/auth/get_user_db.dart';
import 'package:first_project/routes/pop_up.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:first_project/ui/account/profile/account.dart';
import 'package:first_project/ui/control_panel/Auth/validation.dart';
import 'package:first_project/ui/wishlist/wishlist.dart';
import 'package:first_project/ui/categories/Action.dart';
import 'package:first_project/ui/categories/Comedy.dart';
import 'package:first_project/ui/categories/Fantecy.dart';
import 'package:first_project/ui/categories/Horror.dart';
import 'package:first_project/ui/categories/Thriller.dart';
import 'package:first_project/ui/log_out/log_out.dart';
import 'package:first_project/ui/settings/settings.dart';
import 'package:first_project/routes/side_push.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    getUserData();

    return Drawer(
      backgroundColor: AppColors.surface,
      child: ValueListenableBuilder<List<SignUpModel>>(
        valueListenable: usersDetails,
        builder: (context, users, _) {
          if (users.isEmpty) {
            return Center(
              child: Text(
                'No user data available',
                style: TextStyle(color: AppColors.onSurfaceSubtle),
              ),
            );
          }

          final SignUpModel currentUser = users.firstWhere(
            (u) => u.id == id,
          );

          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerHeaderSection(user: currentUser),
                const DrawerDivider(),
                DrawerNavItem(
                  label: 'Home',
                  icon: Icons.home_rounded,
                  onTap: () => popUp(context),
                ),
                DrawerNavItem(
                  label: 'Account',
                  icon: Icons.account_circle_rounded,
                  onTap: () => navigateFromSide(
                    context,
                    AccountPage(userId: currentUser.id!),
                  ),
                ),
                DrawerNavItem(
                  label: 'Favourites',
                  icon: Icons.favorite_rounded,
                  onTap: () => navigateFromSide(
                    context,
                    FavoriteScreen(user: currentUser),
                  ),
                ),
                const DrawerDivider(),
                const DrawerSectionLabel('CATEGORIES'),
                DrawerNavItem(
                  label: 'Comedy',
                  icon: Icons.sentiment_very_satisfied_rounded,
                  indent: true,
                  onTap: () =>
                      navigateFromSide(context, ComedyScreen(userId: id)),
                ),
                DrawerNavItem(
                  label: 'Horror',
                  icon: Icons.warning_amber_rounded,
                  indent: true,
                  onTap: () =>
                      navigateFromSide(context, HorrorScreen(userId: id)),
                ),
                DrawerNavItem(
                  label: 'Thriller',
                  icon: Icons.bolt_rounded,
                  indent: true,
                  onTap: () =>
                      navigateFromSide(context, ThrillerScreen(userId: id)),
                ),
                DrawerNavItem(
                  label: 'Fantasy',
                  icon: Icons.auto_awesome_rounded,
                  indent: true,
                  onTap: () =>
                      navigateFromSide(context, FantecyScreen(userId: id)),
                ),
                DrawerNavItem(
                  label: 'Action',
                  icon: Icons.local_fire_department_rounded,
                  indent: true,
                  onTap: () =>
                      navigateFromSide(context, ActionPage(userId: id)),
                ),
                const DrawerDivider(),
                DrawerNavItem(
                  label: 'Settings',
                  icon: Icons.settings_rounded,
                  onTap: () => navigateFromSide(context, SettingsScreen()),
                ),
                const Spacer(),
                const DrawerDivider(),
                DrawerNavItem(
                  label: 'Control Panel',
                  icon: Icons.admin_panel_settings_rounded,
                  accentColor: Colors.lightBlue[700],
                  onTap: () =>
                      navigateFromSide(context, ValidationScreen(userId: id)),
                ),
                DrawerNavItem(
                  label: 'Log Out',
                  icon: Icons.logout_rounded,
                  accentColor: Colors.red[700],
                  onTap: () => showAdaptiveDialog(
                    context: context,
                    builder: (_) => LogOutDialog(userId: id),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          );
        },
      ),
    );
  }
}
