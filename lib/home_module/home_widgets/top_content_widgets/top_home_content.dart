import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../riverpod_providers/state_providers.dart';
import '../../../theme_constants/app_themes.dart';
import '/components/simple_app_divider.dart';

import '/components/app_text_widget.dart';
import '/theme_constants/app_colors.dart';
import '/theme_constants/app_text_styling.dart';

import '/components/app_space_sized_box.dart';
import '/home_module/home_widgets/top_content_widgets/top_home_widgets.dart';
import 'package:flutter/material.dart';

class TopHomeContent extends ConsumerWidget {
  const TopHomeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeType = ref.watch(appThemeProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: TopHomeWidgets(widgetContext: context).topHomeBar(),
        ),
        const AppSpaceSizedBox(
          spaceHeight: 40,
        ),
        AppTextWidget(
          text: "Organization Insights.",
          textStyle: AppTextStyling.defaultFontBold.copyWith(
            fontSize: 25,
          ),
        ),
        const AppSpaceSizedBox(
          spaceHeight: 5,
        ),
        AppTextWidget(
          text: "Track Your Organization Stats Insights",
          textStyle: AppTextStyling.defaultFontMedium.copyWith(
            fontSize: 18,
            color: AppColors.themeGrey600,
          ),
        ),
        const AppSpaceSizedBox(
          spaceHeight: 25,
        ),
        TopHomeWidgets(widgetContext: context).manageButton(),
        const AppSpaceSizedBox(
          spaceHeight: 20,
        ),
        SimpleAppDivider(
          dividerColor: _giveDividerColor(appTheme: appThemeType),
        ),
      ],
    );
  }

  Color _giveDividerColor({required AppThemeType appTheme}) {
    if (appTheme == AppThemeType.galaxyTheme) {
      return AppColors.richPurpleBlack;
    } else if (appTheme == AppThemeType.citrusTheme) {
      return AppColors.burntOrange;
    } else {
      return AppColors.themeGrey200;
    }
  }
}
