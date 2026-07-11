
import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DialogActions extends StatelessWidget {
  const DialogActions({super.key, 
    required this.isSaving,
    required this.onCancel,
    required this.onSave,
  });

  final bool isSaving;
  final VoidCallback onCancel;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      
        Expanded(
          child: OutlinedButton(
            onPressed: onCancel,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.onSurfaceSubtle,
              side:  BorderSide(color: AppColors.inputBorder),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(AppColors.fieldRadius),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
        ),
        const SizedBox(width: 12),

      
        Expanded(
          child: FilledButton(
            onPressed: isSaving ? null : onSave,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.accent,
              disabledBackgroundColor:
                  AppColors.accent.withValues(alpha: 0.4),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(AppColors.fieldRadius),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: isSaving
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'Save changes',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}