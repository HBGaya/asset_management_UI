import 'dart:ui';

import 'package:asset_management_dashboard/theme_constants/app_themes.dart';

import '../../../../theme_constants/app_colors.dart';

class AttendanceChartThemes {
  final AppThemeType appThemeType;

  AttendanceChartThemes({required this.appThemeType});

  Color giveAbsentColor() {
    if (appThemeType == AppThemeType.galaxyTheme) {
      return AppColors.purpleAccent;
    } else if (appThemeType == AppThemeType.citrusTheme) {
      return AppColors.warmOrange;
    } else {
      return AppColors.redMedium;
    }
  }

  Color giveLateColor() {
    if (appThemeType == AppThemeType.galaxyTheme) {
      return AppColors.mediumPurple;
    } else if (appThemeType == AppThemeType.citrusTheme) {
      return AppColors.primaryOrange;
    } else {
      return AppColors.mustardYellow;
    }
  }

  Color giveOnTimeColor() {
    if (appThemeType == AppThemeType.galaxyTheme) {
      return AppColors.primaryIndigo;
    } else if (appThemeType == AppThemeType.citrusTheme) {
      return AppColors.deepOrange;
    } else {
      return AppColors.greenMedium;
    }
  }
}
