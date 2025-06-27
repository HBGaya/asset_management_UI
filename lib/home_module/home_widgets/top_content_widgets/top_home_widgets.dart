import 'package:asset_management_dashboard/riverpod_providers/state_providers.dart';
import 'package:asset_management_dashboard/theme_constants/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/app_elevated_button.dart';
import '../../../components/app_space_sized_box.dart';
import '../../../components/app_svg_icon.dart';
import '../../../components/app_text_widget.dart';
import '../../../theme_constants/app_colors.dart';
import '../../../theme_constants/app_icons.dart';
import '../../../theme_constants/app_text_styling.dart';

class TopHomeWidgets {
  final BuildContext widgetContext;

  TopHomeWidgets({required this.widgetContext});

  Widget topHomeBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTextWidget(
          text: "John",
          textStyle: AppTextStyling.defaultFontBold.copyWith(
            color: AppColors.darkIndigo.withValues(alpha: 0.95),
            fontSize: 27,
          ),
        ),
        _homeBarIcons(),
      ],
    );
  }

  Widget _homeBarIcons() {
    return Consumer(
      builder: (context, ref, _) {
        final appThemeType = ref.watch(appThemeProvider);
        return Row(
          children: [
            AppSvgIcon(
              svgIconPath: AppIcons.bellIcon,
              svgIconSize: 26,
              colorFilter:
                  _giveIconColor(appTheme: appThemeType, context: context),
            ),
            const AppSpaceSizedBox(
              spaceWidth: 28,
            ),
            AppSvgIcon(
              svgIconPath: AppIcons.chatIcon,
              svgIconSize: 26,
              colorFilter:
                  _giveIconColor(appTheme: appThemeType, context: context),
            ),
            const AppSpaceSizedBox(
              spaceWidth: 28,
            ),
            InkWell(
              onTap: () {
                final scaffoldKey = ref.read(globalScaffold);
                scaffoldKey.currentState?.openEndDrawer();
              },
              child: AppSvgIcon(
                svgIconPath: AppIcons.sideMenuIcon,
                svgIconSize: 26,
                colorFilter: _giveIconMenuColor(
                    appTheme: appThemeType, context: context),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget manageButton() {
    return Row(
      children: [
        AppElevatedButton(
          btnHeight: 49,
          btnElevation: 0,
          btnBorderRadius: 10,
          btnBackgroundColor: AppColors.themeWhite,
          btnBorderColor: AppColors.themeGrey300,
          btnWidget: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_rounded,
                size: 27,
                color: AppColors.themeGrey700,
              ),
              const AppSpaceSizedBox(
                spaceWidth: 10,
              ),
              AppTextWidget(
                text: "manage Widgets",
                textStyle: AppTextStyling.defaultFontSemiBold.copyWith(
                  color: AppColors.themeGrey700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          onPressedAction: () {
            // Navigator.pop(_globalContext);
          },
        ),
        const Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }

  ColorFilter? _giveIconColor(
      {required AppThemeType appTheme, required BuildContext context}) {
    if (appTheme == AppThemeType.galaxyTheme) {
      return const ColorFilter.mode(AppColors.mediumPurple, BlendMode.srcIn);
    } else if (appTheme == AppThemeType.citrusTheme) {
      return const ColorFilter.mode(AppColors.vibrantOrange, BlendMode.srcIn);
    } else {
      return null;
    }
  }

  ColorFilter? _giveIconMenuColor(
      {required AppThemeType appTheme, required BuildContext context}) {
    if (appTheme == AppThemeType.galaxyTheme) {
      return const ColorFilter.mode(AppColors.deepIndigo, BlendMode.srcIn);
    } else if (appTheme == AppThemeType.citrusTheme) {
      return const ColorFilter.mode(AppColors.burntOrange, BlendMode.srcIn);
    } else {
      return null;
    }
  }
}
