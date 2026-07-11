
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/account/profile/widgets/action_card/action_card.dart';
import 'package:first_project/ui/account/profile/widgets/header/silver_header.dart';
import 'package:first_project/ui/account/profile/widgets/section_divider/divider.dart';
import 'package:first_project/core/database/auth/get_user_db.dart';
import 'package:first_project/routes/bottom_push.dart';
import 'package:first_project/routes/pop_up.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:first_project/ui/account/edit_profile/edit_profile.dart';
import 'package:first_project/ui/wishlist/wishlist.dart';
import 'package:first_project/ui/log_out/log_out.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ValueListenableBuilder<List<SignUpModel>>(
        valueListenable: usersDetails,
        builder: (context, users, _) {
          final SignUpModel model = users.firstWhere((e) => e.id == userId);

          return CustomScrollView(
            slivers: [
              AccountSliverHeader(model: model, onBack: () => popUp(context)),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    AccountActionCard(
                      icon: Icons.edit_rounded,
                      label: 'Edit Profile',
                      subtitle: 'Update your name, photo and details',
                      onTap: () => showDialog(
                        context: context,
                        builder: (_) => EditProfile(userId: userId),
                      ),
                    ),
                    const SizedBox(height: 10),
                    AccountActionCard(
                      icon: Icons.favorite_rounded,
                      label: 'Liked Items',
                      subtitle: 'Browse everything you\'ve saved',
                      onTap: () => navigateFromBottomPush(
                        context,
                        FavoriteScreen(user: model),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const SectionDivider(label: 'ACCOUNT'),
                    const SizedBox(height: 10),
                    AccountActionCard(
                      icon: Icons.logout_rounded,
                      label: 'Log Out',
                      subtitle: 'Sign out of your account',
                      isDestructive: true,
                      onTap: () => showDialog(
                        context: context,
                        builder: (_) => LogOutDialog(userId: userId),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
