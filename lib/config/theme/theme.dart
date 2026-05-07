import 'package:flutter/material.dart';
import 'package:taskly/core/constants/colors.dart';

import 'widget_themes/icon_theme.dart';
import 'widget_themes/text_selection_theme.dart';
import 'widget_themes/appbar_theme.dart';
import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/outlined_button_theme.dart';
import 'widget_themes/text_field_theme.dart';
import 'widget_themes/color_scheme.dart';
import 'widget_themes/text_theme.dart';
import 'widget_themes/text_button_theme.dart';
import 'widget_themes/snackbar_theme.dart';
import 'widget_themes/bottom_navbar_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: AppTextTheme.light,
    colorScheme: AppColorScheme.light,
    iconTheme: AppIconTheme.light,
    appBarTheme: AppAppBarTheme.light,
    snackBarTheme: AppSnackbarTheme.light,
    textButtonTheme: AppTextButtonTheme.light,
    inputDecorationTheme: AppInputTheme.light,
    textSelectionTheme: AppTextSelectionTheme.light,
    bottomNavigationBarTheme: AppBottomNavTheme.light,
    elevatedButtonTheme: AppElevatedButtonTheme.light,
    outlinedButtonTheme: AppOutlinedButtonTheme.light,
    scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: AppTextTheme.dark,
    colorScheme: AppColorScheme.dark,
    iconTheme: AppIconTheme.dark,
    appBarTheme: AppAppBarTheme.dark,
    snackBarTheme: AppSnackbarTheme.dark,
    textButtonTheme: AppTextButtonTheme.dark,
    inputDecorationTheme: AppInputTheme.dark,
    textSelectionTheme: AppTextSelectionTheme.dark,
    bottomNavigationBarTheme: AppBottomNavTheme.dark,
    elevatedButtonTheme: AppElevatedButtonTheme.dark,
    outlinedButtonTheme: AppOutlinedButtonTheme.dark,
    scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
  );
}
