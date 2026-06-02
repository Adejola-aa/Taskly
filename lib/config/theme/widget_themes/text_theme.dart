import 'package:flutter/material.dart';
import 'package:taskly/core/constants/colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static const _fontFamily = 'Inter';

  static TextTheme _build(Color primary) => TextTheme(
    // ── Display ──────────────────────────────────────────────────────────
    // Used for hero numbers, splash screens, large marketing copy.
    displayLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 40.0,
      height: 1.2,
      letterSpacing: -0.5,
      fontWeight: FontWeight.w700,
      color: primary,
    ),

    displayMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 32.0,
      height: 1.25,
      letterSpacing: -0.25,
      fontWeight: FontWeight.w600,
      color: primary,
    ),

    displaySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 28.0,
      height: 1.3,
      letterSpacing: -0.1,
      fontWeight: FontWeight.w500,
      color: primary,
    ),

    // ── Headline ─────────────────────────────────────────────────────────
    // Major page titles → section headers → sub-section headers.
    headlineLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24.0,
      height: 1.25,
      letterSpacing: -0.1,
      fontWeight: FontWeight.w700,
      color: primary,
    ),

    headlineMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 20.0,
      height: 1.3,
      letterSpacing: 0.0,
      fontWeight: FontWeight.w600,
      color: primary,
    ),

    headlineSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 18.0,
      height: 1.3,
      letterSpacing: 0.0,
      fontWeight: FontWeight.w600,
      color: primary,
    ),

    // ── Title ─────────────────────────────────────────────────────────────
    // Card / dialog / AppBar titles, list item primaries, form section labels.
    titleLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16.0,
      height: 1.35,
      letterSpacing: 0.1,
      fontWeight: FontWeight.w600,
      color: primary,
    ),

    titleMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      height: 1.4,
      letterSpacing: 0.1,
      fontWeight: FontWeight.w500,
      color: primary,
    ),

    titleSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 13.0,
      height: 1.35,
      letterSpacing: 0.1,
      fontWeight: FontWeight.w600,
      color: primary,
    ),

    // ── Body ──────────────────────────────────────────────────────────────
    // Paragraph text, descriptions, fine print.
    // Opacity steps: primary (1.0) → 0.75 → 0.6 — intentional hierarchy.
    bodyLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 17.0,
      height: 1.55,
      letterSpacing: 0.15,
      fontWeight: FontWeight.w400,
      color: primary,
    ),

    bodyMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      height: 1.5,
      letterSpacing: 0.15,
      fontWeight: FontWeight.w400,
      color: primary.withValues(alpha: 0.75),
    ),

    bodySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12.0,
      height: 1.4,
      letterSpacing: 0.2,
      fontWeight: FontWeight.w400,
      color: primary.withValues(alpha: 0.6),
    ),

    // ── Label ─────────────────────────────────────────────────────────────
    // Buttons, chips, badges, micro text.
    // All labels use tighter line-height (1.2) and clear letter-spacing.
    labelLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      height: 1.2,
      letterSpacing: 0.3,
      fontWeight: FontWeight.w500,
      color: primary,
    ),

    labelMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12.0,
      height: 1.2,
      letterSpacing: 0.3,
      fontWeight: FontWeight.w500,
      color: primary,
    ),

    labelSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 11.0,
      height: 1.2,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w600,
      color: primary,
    ),
  );

  static TextTheme light = _build(AppColors.textPrimary);
  static TextTheme dark = _build(AppColors.darkTextPrimary);
}
