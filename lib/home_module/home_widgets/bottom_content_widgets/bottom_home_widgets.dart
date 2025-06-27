import 'package:asset_management_dashboard/home_module/home_widgets/bottom_content_widgets/attendance_chart_widgets/attendance_summary_tab_bar.dart';

import '../../../theme_constants/app_themes.dart';
import '/components/app_svg_icon.dart';
import '/theme_constants/app_icons.dart';
import 'package:flutter/material.dart';

import '../../../components/app_elevated_button.dart';
import '../../../components/app_space_sized_box.dart';
import '../../../components/app_text_widget.dart';
import '../../../theme_constants/app_colors.dart';
import '../../../theme_constants/app_text_styling.dart';

class BottomHomeWidgets {
  final AppThemeType appTheme;

  BottomHomeWidgets({required this.appTheme});

  Widget attendanceSummaryComponent() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          const AppSpaceSizedBox(
            spaceHeight: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTextWidget(
                text: "Attendance Summary",
                textStyle: AppTextStyling.defaultFontBold.copyWith(
                  fontSize: 19.5,
                  color: AppColors.themeGrey900,
                ),
              ),
              AppSvgIcon(
                svgIconPath: AppIcons.dropDownIcon,
                svgIconSize: 22,
                colorFilter: _giveDropDownIconColor(),
              ),
            ],
          ),
          const AppSpaceSizedBox(
            spaceHeight: 20,
          ),
          const AttendanceSummaryTabBar(),
          const AppSpaceSizedBox(
            spaceHeight: 20,
          ),
        ],
      ),
    );
  }

  Widget learnMoreContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTextWidget(
            text: "Learn more",
            textStyle: AppTextStyling.defaultFontSemiBold.copyWith(
              fontSize: 16,
              color: AppColors.themeGrey600,
            ),
          ),
          AppElevatedButton(
            btnHeight: 47,
            btnElevation: 0,
            btnBorderRadius: 9,
            btnBackgroundColor: AppColors.themeWhite,
            btnBorderColor: AppColors.themeGrey300,
            btnWidget: AppTextWidget(
              text: "View full report",
              textStyle: AppTextStyling.defaultFontSemiBold.copyWith(
                color: AppColors.themeGrey700,
                fontSize: 16.5,
              ),
            ),
            onPressedAction: () {
              // Navigator.pop(_globalContext);
            },
          ),
        ],
      ),
    );
  }

  ColorFilter? _giveDropDownIconColor() {
    if (appTheme == AppThemeType.galaxyTheme) {
      return const ColorFilter.mode(AppColors.mediumPurple, BlendMode.srcIn);
    } else if (appTheme == AppThemeType.citrusTheme) {
      return const ColorFilter.mode(AppColors.vibrantOrange, BlendMode.srcIn);
    } else {
      return null;
    }
  }
}
