import 'package:flutter/material.dart';
import 'package:taskly/core/constants/colors.dart';
import 'package:taskly/core/constants/sizes.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static final light = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.primary,
      disabledBackgroundColor: AppColors.buttonDisabled,

      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.buttonHeight / 3,
        horizontal: AppSizes.lg,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      ),
    ),
  );

  static final dark = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.primaryDark,
      disabledBackgroundColor: AppColors.buttonDisabled,

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
