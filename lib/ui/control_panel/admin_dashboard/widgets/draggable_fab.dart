
import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DraggableFab extends StatelessWidget {
  const DraggableFab({super.key, 
    required this.position,
    required this.onTap,
  });

  final ValueNotifier<Offset> position;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Offset>(
      valueListenable: position,
      builder: (_, offset, __) => Positioned(
        left: offset.dx,
        top: offset.dy,
        child: Draggable(
          feedback: const SizedBox.shrink(),
          onDragEnd: (details) => position.value = details.offset,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha:  0.4),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Icon(Icons.add_rounded, color: Colors.white, size: 28),
            ),
          ),
        ),
      ),
    );
  }
}