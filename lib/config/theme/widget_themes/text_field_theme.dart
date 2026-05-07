import 'package:flutter/material.dart';
import 'package:taskly/core/constants/colors.dart';
import 'package:taskly/core/constants/sizes.dart';

class AppInputTheme {
  AppInputTheme._();

  static final light = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.inputBackground,

    prefixIconColor: AppColors.textSecondary,
    suffixIconColor: AppColors.textSecondary,

    labelStyle: const TextStyle(
      fontSize: 14,
      color: AppColors.textSecondary,
      fontWeight: FontWeight.w500,
    ),

    hintStyle: const TextStyle(fontSize: 14, color: AppColors.textSecondary),

    floatingLabelStyle: const TextStyle(
      color: AppColors.primary,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),

    contentPadding: const EdgeInsets.symmetric(
      vertical: AppSizes.md,
      horizontal: AppSizes.md,
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      borderSide: const BorderSide(color: AppColors.border, width: 1),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      borderSide: const BorderSide(color: AppColors.error, width: 1),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      borderSide: const BorderSide(color: AppColors.error, width: 1.5),
    ),
  );

  static final dark = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.darkCard,

    prefixIconColor: AppColors.textSecondary,
    suffixIconColor: AppColors.textSecondary,

    labelStyle: const TextStyle(
      fontSize: 14,
      color: AppColors.textSecondary,
      fontWeight: FontWeight.w500,
    ),

    hintStyle: const TextStyle(fontSize: 14, color: AppColors.textSecondary),

    floatingLabelStyle: const TextStyle(
      color: AppColors.primary,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),

    contentPadding: const EdgeInsets.symmetric(
      vertical: AppSizes.md,
      horizontal: AppSizes.md,
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      borderSide: const BorderSide(color: AppColors.darkBorder, width: 1),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      borderSide: const BorderSide(color: AppColors.error, width: 1),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      borderSide: const BorderSide(color: AppColors.error, width: 1.5),
    ),
  );
}
