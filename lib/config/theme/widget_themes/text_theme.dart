import 'package:flutter/material.dart';
import 'package:taskly/core/constants/colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme light = const TextTheme(
    headlineMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),

    titleLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),

    bodyMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
    ),
  );

  static TextTheme dark = const TextTheme(
    headlineMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),

    titleLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),

    bodyMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color(0xFFB0B3B8), 
    ),
  );
}
