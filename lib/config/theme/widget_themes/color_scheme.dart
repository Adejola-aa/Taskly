import 'package:flutter/material.dart';
import 'package:taskly/core/constants/colors.dart';

class AppColorScheme {
  AppColorScheme._();

  static const ColorScheme light = ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.primary,
    onPrimary: AppColors.white,

    secondary: AppColors.secondary,
    onSecondary: AppColors.white,

    error: AppColors.error,
    onError: AppColors.white,

    surface: AppColors.lightScaffoldBackground,
    onSurface: AppColors.textPrimary,

    outline: AppColors.border,
    inverseSurface: AppColors.darkScaffoldBackground,
    onInverseSurface: AppColors.white,
  );

  static const ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,

    primary: AppColors.primary,
    onPrimary: AppColors.white,

    secondary: AppColors.secondaryLight,
    onSecondary: AppColors.white,

    error: AppColors.error,
    onError: AppColors.white,

    surface: AppColors.darkScaffoldBackground,
    onSurface: AppColors.white,

    outline: AppColors.darkBorder,
    inverseSurface: AppColors.lightScaffoldBackground,
    onInverseSurface: AppColors.textPrimary,
  );
}
