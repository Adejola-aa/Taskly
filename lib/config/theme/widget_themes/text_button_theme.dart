import 'package:flutter/material.dart';
import 'package:taskly/core/constants/colors.dart';

class AppTextButtonTheme {
  AppTextButtonTheme._();

  static final light = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.textPrimary,
      disabledForegroundColor: AppColors.textSecondary,
      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
    ),
  );

  static final dark = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.white,
      disabledForegroundColor: AppColors.textSecondary,
      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
    ),
  );
}
