import 'package:flutter/material.dart';
import 'package:taskly/core/constants/colors.dart';

class AppIconTheme {
  AppIconTheme._();

  static const light = IconThemeData(color: AppColors.iconPrimary, size: 22);

  static const dark = IconThemeData(color: AppColors.white, size: 22);
}
