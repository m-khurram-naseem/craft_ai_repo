import 'package:craft_ai/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.lightPrimaryColor,
      secondary: AppColors.lightSecondaryColor,
      onSecondary: AppColors.lightOnSecondaryColor,
      surface: AppColors.lightTextColor,
      inverseSurface: AppColors.lightInverseTextColor,
    ),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.lightSecondaryColor , foregroundColor: AppColors.lightTextColor,),
    scaffoldBackgroundColor: AppColors.lightSecondaryColor,
    shadowColor: AppColors.lightPrimaryColor,
  );
  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.darkPrimaryColor,
      secondary: AppColors.darkSecondaryColor,
      onSecondary: AppColors.darkOnSecondaryColor,
      surface: AppColors.darkTextColor,
      inverseSurface: AppColors.darkInverseTextColor,
    ),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.darkSecondaryColor , foregroundColor: AppColors.darkTextColor,),
    scaffoldBackgroundColor: AppColors.darkSecondaryColor,
    shadowColor: AppColors.darkPrimaryColor,
  );
}
