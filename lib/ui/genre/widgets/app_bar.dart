import 'package:first_project/config/genre_config.dart';
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/routes/pop_up.dart';
import 'package:flutter/material.dart';

class GenreSliverAppBar extends StatelessWidget {
  const GenreSliverAppBar({super.key, required this.config});

  final GenreConfig config;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      expandedHeight: 160,
      pinned: true,
      leading: IconButton(
        icon:  Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.onSurface,
          size: 20,
        ),
        onPressed: () => popUp(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background:Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: config.gradientColors,
        ),
      ),
      child: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:  EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(config.icon, color: config.accentColor, size: 32),
                 SizedBox(width: 10),
                Text(
                  '${config.genre} Movies',
                  style: TextStyle(
                    color: config.accentColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
      ),
    );
  }
}
