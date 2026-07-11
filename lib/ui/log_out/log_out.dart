import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/control_panel/movie_management/widgets/app_button.dart';
import 'package:first_project/ui/log_out/controller/controller.dart';
import 'package:flutter/material.dart';


class LogOutDialog extends StatefulWidget {
  const LogOutDialog({super.key, required this.userId});

  final String userId;

  @override
  State<LogOutDialog> createState() => _LogOutDialogState();
}

class _LogOutDialogState extends State<LogOutDialog> {
  late final LogOutController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LogOutController(userId: widget.userId);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleLogout() async {
   
    final messenger = ScaffoldMessenger.maybeOf(context);

    final success = await _controller.logout(context);
    if (!mounted) return;

    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
    }

    messenger?.showSnackBar(
      SnackBar(
        content: Text(
          success
              ? 'You have been logged out successfully.'
              : 'Could not log out. Please try again.',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: success ? AppColors.success : AppColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppColors.fieldRadius)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Dialog(
          backgroundColor: AppColors.surfaceElevated,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppColors.dialogRadius)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppColors.space24,
              AppColors.space32,
              AppColors.space24,
              AppColors.space24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: AppColors.errorSubtle,
                  child: const Icon(
                    Icons.logout_rounded,
                    color: AppColors.error,
                    size: 32,
                  ),
                ),
                const SizedBox(height: AppColors.space20),
                 Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.onSurface,
                  ),
                ),
                const SizedBox(height: AppColors.space12),
                 Text(
                  'Are you sure you want to log out?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: AppColors.onSurfaceSubtle,
                  ),
                ),
                const SizedBox(height: AppColors.space24),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        label: 'Cancel',
                        onPressed: _controller.isLoggingOut
                            ? null
                            : () => Navigator.of(context).pop(),
                      ),
                    ),
                    const SizedBox(width: AppColors.space12),
                    Expanded(
                      child: AppButton(
                        label: 'Logout',
                        isLoading: _controller.isLoggingOut,
                        backgroundColor: AppColors.error,
                        foregroundColor: Colors.white,
                        onPressed: _handleLogout,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}