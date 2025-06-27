import 'package:asset_management_dashboard/theme_constants/app_colors.dart';
import 'package:flutter/material.dart';

enum AppThemeType {
  regularTheme,
  galaxyTheme,
  citrusTheme,
}

class AppThemeColors {
  static final ThemeData regularTheme = ThemeData(
    cardColor: AppColors.themeWhite,

    // Background
    primaryColor: AppColors.themeGrey900,

    // Light grey
    dividerColor: AppColors.themeBlueLight,

    primaryColorDark: AppColors.themeBlueLight,
    primaryColorLight: AppColors.themeWhite,

    shadowColor: AppColors.themeGrey900,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.themeWhite,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(9),
          side: const BorderSide(
            color: AppColors.themeGrey300,
            width: 1.5,
          ),
        ),
      ),
    ),

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryIndigo,
      // Indigo seed
      primary: AppColors.primaryIndigo,
      // Primary
      secondary: AppColors.themeWhite,
      // Accent
      surface: AppColors.themeBlue,
      // Card background
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.themeBlue, // Text on light
    ),
  );

  static final ThemeData galaxyTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.softIndigo,
    // Background
    primaryColor: AppColors.primaryIndigo,
    primaryColorLight: AppColors.softIndigo,
    primaryColorDark: AppColors.darkIndigo,
    // Indigo
    cardColor: AppColors.lightLavender,
    // Light Lavender
    dividerColor: AppColors.indigoGrey,
    // Border
    shadowColor: AppColors.deepPurple,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.softIndigo,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(9),
          side: const BorderSide(
            color: AppColors.indigoGrey,
            width: 1.5,
          ),
        ),
      ),
    ),

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryIndigo,
      // Indigo seed
      primary: AppColors.primaryIndigo,
      // Primary
      secondary: AppColors.purpleAccent,
      // Accent
      surface: AppColors.lightLavender,
      // Card background
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.richPurpleBlack, // Text on light
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkIndigo, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.darkIndigo, fontSize: 14),
      titleLarge: TextStyle(
          color: AppColors.richPurpleBlack,
          fontSize: 20,
          fontWeight: FontWeight.bold),
    ),
  );

  static final ThemeData citrusTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.offWhiteCream,
    // Background
    primaryColor: AppColors.primaryOrange,
    primaryColorDark: AppColors.darkBrownOrange,
    primaryColorLight: AppColors.offWhiteCream,
    // Orange
    cardColor: AppColors.paleOrange1,
    // Pale Orange
    dividerColor: AppColors.warmOrange,
    // Divider
    shadowColor: AppColors.burntOrange,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightOrange,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(9),
          side: const BorderSide(
            color: AppColors.offWhiteCream,
            width: 1.5,
          ),
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryOrange,
      // Orange seed
      primary: AppColors.primaryOrange,
      // Primary
      secondary: AppColors.lightOrange,
      // Accent
      surface: AppColors.paleOrange1,
      // Card
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.deepBrownOrange, // Text
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkBrownOrange, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.darkBrownOrange, fontSize: 14),
      titleLarge: TextStyle(
          color: AppColors.deepBrownOrange,
          fontSize: 20,
          fontWeight: FontWeight.bold),
    ),
  );
}
