import 'package:first_project/file_structure/core/const/app_colors.dart';
import 'package:first_project/file_structure/ui/account/controller/controller.dart';
import 'package:first_project/file_structure/ui/account/edit_profile/widgets/header/avatar_picker.dart';
import 'package:first_project/file_structure/ui/account/edit_profile/widgets/header/dialog_actions.dart';
import 'package:first_project/file_structure/ui/account/edit_profile/widgets/header/dialog_header.dart';
import 'package:first_project/file_structure/ui/account/edit_profile/widgets/header/profile_field.dart';
import 'package:first_project/function/hive_functions/log_functions/get_user_db.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:flutter/material.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final AccountController controller = AccountController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<SignUpModel>>(
      valueListenable: usersDetails,
      builder: (context, users, _) {
        controller.initUser(widget.userId, users);

        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(
                AppColors.dialogRadius,
              ),
              border: Border.all(
                color: AppColors.divider,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DialogHeader(
                  onClose: () => Navigator.pop(context),
                ),
                const Divider(
                  height: 1,
                  color: AppColors.divider,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    24,
                    28,
                    24,
                    24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AvatarPicker(
                        imagePath: controller.imagePath,
                        onTap: () async {
                          await controller.pickImage();
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 28),
                      ProfileField(
                        controller: controller.nameController,
                        label: 'Full Name',
                        hint: 'Enter your name',
                        icon: Icons.person_rounded,
                      ),
                      const SizedBox(height: 14),
                      ProfileField(
                        controller: controller.emailController,
                        label: 'Email Address',
                        hint: 'Enter your email',
                        icon: Icons.email_rounded,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 28),
                      DialogActions(
                        isSaving: controller.isSaving,
                        onCancel: () => Navigator.pop(context),
                        onSave: () async {
                          final success = await controller.saveProfile(
                            widget.userId,
                          );

                          if (!success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Name and email cannot be empty',
                                ),
                              ),
                            );
                            return;
                          }

                          if (mounted) {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
