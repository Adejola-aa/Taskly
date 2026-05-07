import 'package:flutter/material.dart';
import 'package:taskly/core/constants/colors.dart';
import 'package:taskly/core/constants/sizes.dart';

class AppOutlinedButtonTheme {
  AppOutlinedButtonTheme._();

  static final light = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary,
      side: const BorderSide(color: AppColors.primary),
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.buttonHeight / 3,
        horizontal: AppSizes.lg,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      ),
    ),
  );

  static final dark = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.white,
      side: const BorderSide(color: AppColors.white),
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.buttonHeight / 3,
        horizontal: AppSizes.lg,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      ),
    ),
  );
}
