import 'package:flutter/material.dart';
import 'package:taskly/core/constants/colors.dart';

class AppAppBarTheme {
  AppAppBarTheme._();

  static final light = AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.transparent,
    surfaceTintColor: AppColors.transparent,
    iconTheme: const IconThemeData(color: AppColors.textPrimary, size: 20),
    actionsIconTheme: const IconThemeData(
      color: AppColors.textPrimary,
      size: 20,
    ),
    titleTextStyle: const TextStyle(
      color: AppColors.textPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Inter',
    ),
  );

  static final dark = AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.transparent,
    surfaceTintColor: AppColors.transparent,
    iconTheme: const IconThemeData(color: AppColors.white, size: 20),
    actionsIconTheme: const IconThemeData(color: AppColors.white, size: 20),
    titleTextStyle: const TextStyle(
      color: AppColors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Inter',
    ),
  );
}
