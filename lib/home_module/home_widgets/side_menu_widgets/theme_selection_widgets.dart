import 'package:asset_management_dashboard/components/app_space_sized_box.dart';
import 'package:asset_management_dashboard/components/app_text_widget.dart';
import 'package:asset_management_dashboard/home_module/home_view_models/side_menu_view_model.dart';
import 'package:asset_management_dashboard/riverpod_providers/state_providers.dart';
import 'package:asset_management_dashboard/theme_constants/app_colors.dart';
import 'package:asset_management_dashboard/theme_constants/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme_constants/app_text_styling.dart';

mixin ThemeSelectionWidgets {
  Widget themeOptionRow(
      {required String themeTitle, required Color lightThemeColor}) {
    return Consumer(
      builder: (context, ref, __) {
        final appThemeType = ref.watch(appThemeProvider);
        return InkWell(
          onTap: () {
            SideMenuViewModel(ref: ref).changeAppTheme(themeTitle: themeTitle);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: _themeSelectedColor(
                  themeType: appThemeType, themeTitle: themeTitle),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _colorIndicator(
                  borderColor: lightThemeColor,
                  darkGradientColor: Theme.of(context).primaryColor,
                  themeGradientColor: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: _themeGradientColor(themeTitle: themeTitle),
                  ),
                ),
                const AppSpaceSizedBox(
                  spaceWidth: 30,
                ),
                AppTextWidget(
                  text: themeTitle,
                  textStyle: AppTextStyling.defaultFontBold.copyWith(
                    fontSize: 22,
                    color: _textColor(
                        appThemeType: appThemeType, context: context),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _colorIndicator(
      {required Color borderColor,
      required Color darkGradientColor,
      required LinearGradient themeGradientColor}) {
    return Container(
      height: 30,
      width: 30,
      padding: const EdgeInsets.all(3.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Container(
        decoration:
            BoxDecoration(gradient: themeGradientColor, shape: BoxShape.circle),
        child: const SizedBox(),
      ),
    );
  }

  Color _themeSelectedColor(
      {required AppThemeType themeType, required String themeTitle}) {
    if (themeType == AppThemeType.galaxyTheme && themeTitle == "Galaxy") {
      return AppColors.softIndigo;
    } else if (themeType == AppThemeType.citrusTheme &&
        themeTitle == "Citrus") {
      return AppColors.paleOrange1;
    } else if (themeType == AppThemeType.regularTheme &&
        themeTitle == "Light") {
      return AppColors.themeSelectionShadow;
    } else {
      return AppColors.transparentColor;
    }
  }

  List<Color> _themeGradientColor({required String themeTitle}) {
    if (themeTitle == "Galaxy") {
      return [AppColors.primaryIndigo, AppColors.softIndigo];
    } else if (themeTitle == "Citrus") {
      return [AppColors.primaryOrange, AppColors.lightOrange];
    } else {
      return [AppColors.themeGrey300, AppColors.themeWhiteBackground];
    }
  }

  Color _textColor(
      {required AppThemeType appThemeType, required BuildContext context}) {
    if (appThemeType == AppThemeType.regularTheme) {
      return AppColors.themeGrey900;
    } else {
      return Theme.of(context).colorScheme.onSurface;
    }
  }
}
