
import 'dart:ui';
import 'package:first_project/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
class AppColors {
  static bool get _dark => isDark.value;

  // ── Backgrounds ────────────────────────────────────────────────────────────
  static Color get background =>
      _dark ? const Color(0xFF0A0A0F) : Colors.white;
  static Color get surface =>
      _dark ? const Color(0xFF14141C) : Colors.white;
  static Color get surfaceElevated =>
      _dark ? const Color(0xFF1C1C28) : const Color(0xFFF5F5F8);
  static Color get surfaceVariant => surface;

  // ── Text / icons ───────────────────────────────────────────────────────────
  static Color get onSurface =>
      _dark ? const Color(0xFFEDEDF2) : const Color(0xFF14141C);
  static Color get onSurfaceSubtle =>
      _dark ? const Color(0xFF8B8B9A) : const Color(0xFF6B7280);

  // ── Structural ─────────────────────────────────────────────────────────────
  static Color get divider =>
      _dark ? const Color(0xFF23232F) : const Color(0xFFE7E8EC);
  static Color get border =>
      _dark ? const Color(0xFF2A2A38) : const Color(0xFFE0E0E5);
  static Color get avatarRing => border;
  static Color get inputBorder => border;
  static const Color inputFocusedBorder = Color(0xFF2E5CFF);

  // ── Inputs ─────────────────────────────────────────────────────────────────
  static Color get inputFill =>
      _dark ? const Color(0xFF1C1C28) : const Color(0xFFF2F2F5);

  // ── Accent ─────────────────────────────────────────────────────────────────
  static const Color accent = Color(0xFFE5253A);
  static const Color accentSubtle = Color(0x1FE5253A);

  // ── Avatar ─────────────────────────────────────────────────────────────────
  static Color get avatarFallback => border;
  static Color get avatarIcon => onSurfaceSubtle;

  // ── Star rating ────────────────────────────────────────────────────────────
  static const Color starRating = Color(0xFFFFC107);

  // ── Status / feedback ────────────────────────────────────────────────────────
  static const Color success = Color(0xFF2E5CFF);
  static const Color error = Color(0xFFE5253A);
  static const Color errorSubtle = Color(0x1FE5253A);
  static const Color info = Color(0xFF2E5CFF);

  // ── Gradients ──────────────────────────────────────────────────────────────
  static List<Color> get headerGradient => _dark
      ? const [
          Color(0xFF0A0A0F),
          Color(0xFF1A0E14),
          Color(0x00E5253A),
        ]
      : const [
          Color(0xFFFFFFFF),
          Color(0xFFFCEBEE),
          Color(0x00E5253A),
        ];

  // ── Legacy aliases (theme-aware) ────────────────────────────────────────────
  // These mirror the naming from the old global-variable theme system.
  // Kept as-is for backward compatibility with widgets already using them.
  static Color get bagroundBlack => background;
  static Color get bagroundWeight => onSurface;
  static Color get textWeight => onSurface;
  static Color get textBlack => background;

  static Color get opendcityWhite =>
      (_dark ? Colors.white70 : Colors.black).withValues(alpha: 0.55);
  static Color get opendecityBlack =>
      (_dark ? Colors.black : Colors.white).withValues(alpha: 0.55);

  // ── Legacy aliases (theme-independent) ──────────────────────────────────────
  // These don't swap with theme — a red is a red, a blue is a blue,
  // regardless of light/dark mode. (See note above about the swap bug.)
  static const Color red = Colors.red;
  static const Color blue = Colors.blue;
  static Color get opacityRed => Colors.red.withValues(alpha: 0.62);
  static Color get opacityBlue => Colors.blue.withValues(alpha: 0.64);

  static Color get weight => Colors.white.withValues(alpha: 0.1);
  static Color get black => Colors.black.withValues(alpha: 0.1);
  static Color get color => Colors.blue.withValues(alpha: 0.2);
  static Color get colorR => Colors.red.withValues(alpha: 0.2);

  // Fixed white — used for icons/overlays on top of images regardless of
  // theme (e.g. play buttons on movie posters), so this intentionally does
  // NOT follow isDark.
  static const Color constWeght = Colors.white;

  // ── Radii ──────────────────────────────────────────────────────────────────
  static const double cardRadius = 14;
  static const double avatarRadius = 44;
  static const double fieldRadius = 12;
  static const double dialogRadius = 20;

  // ── Spacing scale ────────────────────────────────────────────────────────────
  static const double space4 = 4;
  static const double space6 = 6;
  static const double space8 = 8;
  static const double space10 = 10;
  static const double space12 = 12;
  static const double space14 = 14;
  static const double space16 = 16;
  static const double space20 = 20;
  static const double space24 = 24;
  static const double space28 = 28;
  static const double space32 = 32;
}

// Not a color — belongs at the top level, not inside AppColors.
final GlobalKey<FormState> globalKey = GlobalKey<FormState>();