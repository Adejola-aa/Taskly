import 'package:flutter/material.dart';
import 'package:taskly/core/constants/colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static const _fontFamily = 'Inter';

  static TextTheme light = TextTheme(
    displayLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 40.0,
      height: 1.4,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    ),
    displayMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 32.0,
      height: 1.18,
      letterSpacing: -0.25,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    displaySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24.0,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
    ),

    //  Major page titles
    headlineLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24,
      height: 1.25,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),

    //  Section header (MOST USED)
    headlineMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),

    // Sub Section Header
    headlineSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),

    // Card / Dialog / AppBar titles
    titleLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 17.0,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),

    titleMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      height: 1.0,
      color: AppColors.textPrimary,
    ),

    titleSmall: TextStyle(
      fontSize: 13.0,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      height: 1.35,
      letterSpacing: 0.1,
      color: AppColors.textPrimary,
    ),

    //  Paragraph text
    bodyLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 17.0,
      height: 1.55,
      letterSpacing: 0.2,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
    ),

    //  Descriptions / helper tex
    bodyMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      height: 1.5,
      letterSpacing: 0.2,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary.withValues(alpha: 0.75),
    ),

    //  Input labels / fine print
    bodySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      height: 1.4,
      letterSpacing: 0.2,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary.withValues(alpha: 0.6),
    ),

    labelLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.2,
      color: AppColors.textPrimary,
      letterSpacing: 0.3,
    ),

    //  Chips / small buttons
    labelMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      height: 1.2,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      letterSpacing: 0.3,
    ),

    //  Badges / micro text
    labelSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 11,
      height: 1.2,
      letterSpacing: 0.35,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
  );

  /* -- Dark Text Theme -- */
  static TextTheme dark = TextTheme(
    displayLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 40.0,
      height: 1.4,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: AppColors.darkTextPrimary,
    ),
    displayMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 32.0,
      height: 1.18,
      letterSpacing: -0.25,
      fontWeight: FontWeight.w700,
      color: AppColors.darkTextPrimary,
    ),
    displaySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24.0,
      fontWeight: FontWeight.normal,
      color: AppColors.darkTextPrimary,
    ),

    //  Major page titles
    headlineLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24,
      color: AppColors.darkTextPrimary,
      fontWeight: FontWeight.w700,
      height: 1.25,
    ),

    //  Section header (MOST USED)
    headlineMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextPrimary,
    ),

    // Sub Section Header
    headlineSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextPrimary,
    ),

    // Card / Dialog / AppBar titles
    titleLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 17.0,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextPrimary,
    ),

    titleMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      height: 1.0,
      color: AppColors.darkTextPrimary,
    ),

    titleSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 13.0,
      color: AppColors.darkTextPrimary,
      fontWeight: FontWeight.w600,
      height: 1.35,
      letterSpacing: 0.1,
    ),

    //  Paragraph text
    bodyLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 17.0,
      height: 1.55,
      letterSpacing: 0.2,
      fontWeight: FontWeight.w400,
      color: AppColors.darkTextPrimary,
    ),

    //  Descriptions / helper tex
    bodyMedium: TextStyle(
      fontSize: 14.0,
      height: 1.5,
      letterSpacing: 0.2,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      color: AppColors.darkTextPrimary.withValues(alpha: 0.75),
    ),

    //  Input labels / fine print
    bodySmall: TextStyle(
      fontSize: 12,
      height: 1.4,
      letterSpacing: 0.2,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      color: AppColors.darkTextPrimary.withValues(alpha: 0.6),
    ),

    labelLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.2,
      color: AppColors.darkTextPrimary,
      letterSpacing: 0.3,
    ),

    //  Chips / small buttons
    labelMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      height: 1.2,
      fontWeight: FontWeight.w500,
      color: AppColors.darkTextPrimary,
      letterSpacing: 0.3,
    ),

    //  Badges / micro text
    labelSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 11,
      height: 1.2,
      letterSpacing: 0.35,
      fontWeight: FontWeight.w600,
      color: AppColors.darkTextPrimary,
    ),
  );
}
