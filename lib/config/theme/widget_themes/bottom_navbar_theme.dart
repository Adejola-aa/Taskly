import 'package:flutter/material.dart';
import 'package:taskly/core/constants/colors.dart';

class AppBottomNavTheme {
  AppBottomNavTheme._();

  static const light = BottomNavigationBarThemeData(
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.textSecondary,
    selectedLabelStyle: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      fontFamily: 'Inter',
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter',
    ),
  );

  static const dark = BottomNavigationBarThemeData(
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColors.darkBackground,
    selectedItemColor: AppColors.white,
    unselectedItemColor: AppColors.textSecondary,
    selectedLabelStyle: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      fontFamily: 'Inter',
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter',
    ),
  );
}
