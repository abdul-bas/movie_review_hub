import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/search_screen/search_screen.dart';

import 'package:first_project/routes/pop_up.dart';

import 'package:flutter/material.dart';

class AdminSliverAppBar extends StatelessWidget {
  const AdminSliverAppBar({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.background,
      expandedHeight: 275,
      leading: IconButton(
        icon:  Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.onSurface,
          size: 20,
        ),
        onPressed: () => popUp(context),
      ),
      title:  Text(
        'Admin Panel',
        style: TextStyle(
          color: AppColors.onSurface,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      bottom:  PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(color: AppColors.divider, height: 1),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          children: [
            ClipRRect(
              child: SafeArea(
                child: Align(
                  alignment: Alignment
                      .bottomCenter, // fixed: was AlignmentGeometry.bottomCenter
                  child: Opacity(
                    opacity: 0.25,
                    child: Image.asset(
                      'assets/Screenshot_2024-12-28_142342-removebg-preview.png',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
            
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: SafeArea(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: TextField(
  readOnly: true,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SearchScreen(userId: userId)),
    );
  },
  style:  TextStyle(color: AppColors.onSurface),
  decoration: InputDecoration(
    filled: true,
    fillColor: AppColors.inputFill,
    hintText: 'Search movies…',
    hintStyle:  TextStyle(color: AppColors.onSurfaceSubtle),
    prefixIcon:  Icon(Icons.search_rounded, color: AppColors.onSurfaceSubtle),
    

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
  ),
),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
