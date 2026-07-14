import 'package:first_project/core/constants/home_list.dart';
import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildHomeCategoryBar(
    BuildContext context, int selectedIndex, double width, double height,
    {required ValueNotifier currentIndex}) {
  return SizedBox(
    height: 40,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 7),
      itemCount: home.length,
      separatorBuilder: (context, index) => SizedBox(
        width: 7,
      ),
      itemBuilder: (context, index) {
        final isSelected = selectedIndex == index;
        final label = home[index];
        return GestureDetector(
          onTap: () {
            currentIndex.value = index;
            // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
            currentIndex.notifyListeners();
          },
          child: AnimatedContainer(
            height: 30,
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.red[900]
                  : AppColors.textWeight.withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected ? Colors.red[700]! : Colors.transparent,
                width: 1,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Colors.red[900]!.withValues(alpha: 0.35),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : [],
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                  color: isSelected
                      ? Colors.white
                      : AppColors.textWeight.withValues(alpha: 0.55),
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
