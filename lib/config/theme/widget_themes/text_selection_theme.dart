import 'package:flutter/material.dart';
import 'package:taskly/core/constants/colors.dart';

class AppTextSelectionTheme {
  AppTextSelectionTheme._();

  static final light = TextSelectionThemeData(
    cursorColor: AppColors.primary,
    selectionColor: AppColors.primary.withValues(alpha: 0.25),
    selectionHandleColor: AppColors.primary,
  );

  static final dark = TextSelectionThemeData(
    cursorColor: AppColors.primary,
    selectionColor: AppColors.primary.withValues(alpha: 0.35),
    selectionHandleColor: AppColors.primary,
  );
}
