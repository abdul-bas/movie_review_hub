
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/control_panel/movie_management/controller/delete_controller.dart';
import 'package:first_project/ui/control_panel/movie_management/widgets/app_button.dart';
import 'package:flutter/material.dart';


class DeleteMovieDialog extends StatefulWidget {
  const DeleteMovieDialog({
    super.key,
    required this.movieTitle,
    required this.movieId,
  });

  final String movieTitle;
  final String movieId;

  @override
  State<DeleteMovieDialog> createState() => _DeleteMovieDialogState();
}

class _DeleteMovieDialogState extends State<DeleteMovieDialog> {
  late final DeleteMovieController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DeleteMovieController(movieId: widget.movieId);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                    Icons.warning_rounded,
                    color: AppColors.error,
                    size: 32,
                  ),
                ),
                const SizedBox(height: AppColors.space20),
                 Text(
                  'Delete Movie',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.onSurface,
                  ),
                ),
                const SizedBox(height: AppColors.space12),
                Text.rich(
                  TextSpan(
                    style:  TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: AppColors.onSurfaceSubtle,
                    ),
                    children: [
                      const TextSpan(text: 'Are you sure you want to delete '),
                      TextSpan(
                        text: '"${widget.movieTitle}"',
                        style:  TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.onSurface,
                        ),
                      ),
                      const TextSpan(text: '? This action cannot be undone.'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppColors.space24),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        label: 'Cancel',
                        onPressed: _controller.isDeleting
                            ? null
                            : () => Navigator.of(context).pop(),
                      ),
                    ),
                    const SizedBox(width: AppColors.space12),
                    Expanded(
                      child: AppButton(
                        label: 'Delete',
                        isLoading: _controller.isDeleting,
                        backgroundColor: AppColors.error,
                        foregroundColor: Colors.white,
                        onPressed: () => _controller.handleDelete(context),
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