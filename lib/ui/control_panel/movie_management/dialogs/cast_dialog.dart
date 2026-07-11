import 'dart:io';

import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/control_panel/movie_management/controller/form_controller.dart';
import 'package:first_project/ui/control_panel/movie_management/widgets/app_button.dart';
import 'package:first_project/ui/control_panel/movie_management/widgets/text_field.dart';
import 'package:flutter/material.dart';

class AddCastDialog extends StatefulWidget {
  const AddCastDialog({super.key, required this.controller});

  final MovieFormController controller;

  @override
  State<AddCastDialog> createState() => _AddCastDialogState();
}

class _AddCastDialogState extends State<AddCastDialog> {
  String? _error;

  @override
  void initState() {
    super.initState();
    widget.controller.resetCastDialogState();
  }

  Future<void> _pickPhoto() async {
    await widget.controller.pickCastPhoto();
    setState(() {});
  }

  void _submit() {
    final error = widget.controller.commitCastEntry();
    if (error != null) {
      setState(() => _error = error);
      return;
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final photo = widget.controller.pendingCastPhoto;

    return Dialog(
      backgroundColor: AppColors.surfaceElevated,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppColors.dialogRadius)),
      child: Padding(
        padding: const EdgeInsets.all(AppColors.space24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             Text(
              'Add Cast Member',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.onSurface,
              ),
            ),
            const SizedBox(height: AppColors.space20),
            InkWell(
              onTap: _pickPhoto,
              borderRadius: BorderRadius.circular(48),
              child: CircleAvatar(
                radius: 48,
                backgroundColor: AppColors.avatarRing,
                child: CircleAvatar(
                  radius: 46,
                  backgroundColor: AppColors.avatarFallback,
                  backgroundImage:
                      photo != null ? FileImage(File(photo)) : null,
                  child: photo == null
                      ?  Icon(Icons.add_photo_alternate_outlined,
                          size: 32, color: AppColors.avatarIcon)
                      : null,
                ),
              ),
            ),
            const SizedBox(height: AppColors.space20),
            AppTextField(
              controller: widget.controller.castNameController,
              label: 'Cast Name',
              icon: Icons.person_outline,
            ),
            if (_error != null) ...[
              const SizedBox(height: AppColors.space8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _error!,
                  style: const TextStyle(color: AppColors.error, fontSize: 12),
                ),
              ),
            ],
            const SizedBox(height: AppColors.space24),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: 'Cancel',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(width: AppColors.space12),
                Expanded(
                  child: AppButton(
                    label: 'Add',
                    isPrimary: true,
                    onPressed: _submit,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
