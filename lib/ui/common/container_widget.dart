// ignore: must_be_immutable
import 'dart:io';
import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/core/theme/app_theme.dart';
import 'package:flutter/material.dart';


class ContainerWidget extends StatelessWidget {
  const ContainerWidget(
      {super.key,
      this.fileImage,
      this.child,
      this.assetImage,
      this.height,
      this.width,
      this.color,
      this.paddingH,
      this.paddingV,
      this.radius,
      this.imgBaground,
      this.shape,
      this.gradient,
      this.border,
      this.gredient1,
      this.borderColor,
      this.alignment,
      this.onTap,
      this.gridPattrn,
      this.radiusBottom,
      this.topRadius});
  final double? height;
  final double? width;
  final String? fileImage;
  final String? assetImage;
  final Widget? child;
  final dynamic color;
  final double? paddingH;
  final double? paddingV;
  final double? radius;
  final dynamic imgBaground;
  final bool? shape;
  final bool? gradient;
  final bool? border;
  final dynamic borderColor;
  final bool? gredient1;
  final Function()? onTap;
  final dynamic alignment;
  final bool? gridPattrn;
  final Radius? radiusBottom;
  final Radius? topRadius;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: paddingH != null ? screenHeight * paddingH! : 0,
            vertical: paddingV != null ? screenWidth * paddingV! : 0),
        child: GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          child: Container(
            // ignore: unnecessary_null_in_if_null_operators
            alignment: alignment ?? null,
            height: height != null ? screenHeight * height! : screenHeight,
            width: width != null ? screenWidth * width! : screenWidth,
            // ignore: sort_child_properties_last
            child: child,
            decoration: BoxDecoration(
              border: border != null
                  ? Border.all(width: 1.0, color: borderColor ??AppColors. textWeight)
                  : null,
              gradient: gradient != null
                  ? LinearGradient(colors: [
                      isDark.value
                          ? const Color.fromARGB(171, 213, 0, 0)
                          : Colors.blue,
                      Colors.black,
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                  : gredient1 != null
                      ? LinearGradient(colors: [
                          // ignore: deprecated_member_use
                          isDark.value ?  const Color(0xFF1C1C1C): const Color(0xFFFF9A8B),
                          isDark.value
                              ? const Color(0xFF4B6CB7)
                              : const Color(0xFFFF6A88),
                        ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                      : null,
              // ignore: unnecessary_null_comparison
              borderRadius: radiusBottom != null || topRadius != null
                  ? BorderRadius.vertical(
                      bottom: radiusBottom ?? Radius.zero,
                      top: topRadius ?? Radius.zero)
                  : BorderRadius.circular(radius ?? 0),
              color: gradient == null
                  ? color
                  : gridPattrn != null
                      ? const GridPaper()
                      : null,
              image: fileImage != null
                  ? DecorationImage(
                      image: FileImage(File(fileImage!)),
                      // ignore: prefer_if_null_operators
                      fit: imgBaground != null ? imgBaground : BoxFit.cover)
                  : assetImage != null
                      ? DecorationImage(
                          image: AssetImage(assetImage!),
                          // ignore: prefer_if_null_operators
                          fit: imgBaground != null ? imgBaground : BoxFit.cover)
                      : null,
            ),
          ),
        ));
  }
}
