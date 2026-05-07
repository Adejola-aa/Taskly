import 'package:flutter/material.dart';
import 'package:taskly/core/constants/colors.dart';

class AppSnackbarTheme {
  AppSnackbarTheme._();

  static final light = SnackBarThemeData(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: AppColors.transparent,
    dismissDirection: DismissDirection.horizontal,

    contentTextStyle: TextStyle(
      height: 1.2,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    ),
  );

  static final dark = SnackBarThemeData(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: AppColors.transparent,
    dismissDirection: DismissDirection.horizontal,

    contentTextStyle: TextStyle(
      height: 1.2,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
  );
}
