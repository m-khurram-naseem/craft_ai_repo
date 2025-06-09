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
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightSecondaryColor,
      foregroundColor: AppColors.lightTextColor,
    ),
    scaffoldBackgroundColor: AppColors.lightSecondaryColor,
    shadowColor: AppColors.lightPrimaryColor,
    // datePickerTheme: DatePickerThemeData(
    //   backgroundColor: AppColors.lightSecondaryColor,
    // ),
  );
  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.darkPrimaryColor,
      secondary: AppColors.darkSecondaryColor,
      onSecondary: AppColors.darkOnSecondaryColor,
      surface: AppColors.darkTextColor,
      inverseSurface: AppColors.darkInverseTextColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkSecondaryColor,
      foregroundColor: AppColors.darkTextColor,
    ),
    scaffoldBackgroundColor: AppColors.darkSecondaryColor,
    shadowColor: AppColors.darkPrimaryColor,
    // datePickerTheme: DatePickerThemeData(
    //   backgroundColor: AppColors.darkSecondaryColor,
    //   dayStyle: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w700),
    //   dayForegroundColor: WidgetStateColor.resolveWith((states) {
    //     if (states.contains(WidgetState.selected)) {
    //       return AppColors.darkSecondaryColor;
    //     } else if (states.contains(WidgetState.disabled)) {
    //       return AppColors.darkPrimaryColor.withAlpha(150);
    //     }
    //     return AppColors.darkPrimaryColor;
    //   }),
    //   weekdayStyle: TextStyle(
    //     fontFamily: 'Urbanist',
    //     color: AppColors.darkPrimaryColor,
    //     fontWeight: FontWeight.bold,
    //   ),
    //   yearForegroundColor: WidgetStateColor.resolveWith(
    //     (states) => AppColors.darkPrimaryColor,
    //   ),
    //   headerForegroundColor: AppColors.darkPrimaryColor,
    //   yearOverlayColor: WidgetStateColor.resolveWith(
    //     (states) => AppColors.darkPrimaryColor,
    //   ),
    //   yearStyle: TextStyle(
    //     fontFamily: 'Urbanist',
    //     fontWeight: FontWeight.bold,
    //     color: AppColors.darkPrimaryColor,
    //   ),
    //   inputDecorationTheme: InputDecorationTheme(
    //     hintStyle: TextStyle(
    //       fontFamily: 'Urbanist',
    //       color: AppColors.darkPrimaryColor.withAlpha(150),          
    //     ),        
    //   ),
    //   dividerColor: AppColors.darkPrimaryColor,
    //   headerHeadlineStyle: TextStyle(fontFamily: 'Urbanist' , fontWeight: FontWeight.bold , color: AppColors.darkPrimaryColor),
    //   // surfaceTintColor: AppColors.darkPrimaryColor,
    //   rangePickerHeaderForegroundColor: AppColors.darkPrimaryColor,
    //   rangePickerHeaderHeadlineStyle:TextStyle(fontFamily: 'Urbanist' , fontWeight: FontWeight.bold , color: AppColors.darkPrimaryColor), 
    //   rangePickerHeaderHelpStyle: TextStyle(fontFamily: 'Urbanist' , fontWeight: FontWeight.bold , color: AppColors.darkPrimaryColor),                  
    // ),
  );
}
