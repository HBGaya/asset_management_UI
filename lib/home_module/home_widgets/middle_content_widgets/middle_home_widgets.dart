import '/components/app_svg_icon.dart';
import '/theme_constants/app_colors.dart';
import '/theme_constants/app_icons.dart';
import 'package:flutter/material.dart';

import '../../../components/app_space_sized_box.dart';
import '../../../components/app_text_widget.dart';
import '../../../components/simple_app_divider.dart';
import '../../../theme_constants/app_text_styling.dart';

class MiddleHomeWidgets {
  final BuildContext buildContext;

  MiddleHomeWidgets({required this.buildContext});

  Widget welcomeBackContent() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 23,
        top: 25,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextWidget(
                text: "Welcome Back, XYZ!",
                textStyle: AppTextStyling.defaultFontBold
                    .copyWith(fontSize: 20, color: AppColors.themeWhite),
              ),
              const AppSpaceSizedBox(
                spaceHeight: 10,
              ),
              AppTextWidget(
                text: "Take A Look at Our Weekly Reports.",
                textStyle: AppTextStyling.defaultFontLight
                    .copyWith(fontSize: 13.5, color: AppColors.themeWhite),
              ),
            ],
          ),
          _welcomeButton(),
        ],
      ),
    );
  }

  Widget _welcomeButton() {
    return Container(
      margin: const EdgeInsets.only(
        top: 7,
      ),
      padding: const EdgeInsets.all(
        8,
      ),
      decoration: BoxDecoration(
        color: Theme.of(buildContext).primaryColorLight,
        // color: AppColors.softIndigo,
        borderRadius: BorderRadius.circular(10),
      ),
      child: AppSvgIcon(
        svgIconPath: AppIcons.forkIcon,
        colorFilter: ColorFilter.mode(
            // AppColors.darkIndigo,
            Theme.of(buildContext).primaryColorDark,
            BlendMode.srcIn),
        svgIconSize: 23,
      ),
    );
  }

  Widget statisticWidget({
    required String mainHeadingText,
    required Color dividerColor,
    String mainTextStat1 = "test1",
    String mainTextStat2 = "test2",
    String factorTextStat1 = "Avg.",
    String factorTextStat2 = "Avg.",
    String percentageTextStat1 = "15%",
    String percentageTextStat2 = "15%",
    bool showPercentageComponent1 = true,
    bool showPercentageComponent2 = true,
    bool isPercentageRaised1 = true,
    bool isPercentageRaised2 = true,
    List<TextSpan> mainTextSpanStat1 = const [],
    List<TextSpan> mainTextSpanStat2 = const [],
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextWidget(
            text: mainHeadingText,
            textStyle: AppTextStyling.defaultFontBold
                .copyWith(fontSize: 18.75, color: AppColors.themeWhite),
          ),
          const AppSpaceSizedBox(
            spaceHeight: 3,
          ),
          SimpleAppDivider(
            dividerColor: dividerColor,
            dividerThickness: 1.2,
          ),
          const AppSpaceSizedBox(
            spaceHeight: 10,
          ),
          Row(
            children: [
              Expanded(
                child: _mainStatsDetails(
                  showPercentageStat: showPercentageComponent1,
                  isRaised: isPercentageRaised1,
                  defaultStatText: mainTextStat1,
                  factorText: factorTextStat1,
                  percentageText: percentageTextStat1,
                  textSpanList: mainTextSpanStat1,
                ),
              ),
              Expanded(
                child: _mainStatsDetails(
                  showPercentageStat: showPercentageComponent2,
                  isRaised: isPercentageRaised2,
                  defaultStatText: mainTextStat2,
                  factorText: factorTextStat2,
                  percentageText: percentageTextStat2,
                  textSpanList: mainTextSpanStat2,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Column _mainStatsDetails({
    required bool showPercentageStat,
    required bool isRaised,
    required String defaultStatText,
    required String percentageText,
    required List<TextSpan> textSpanList,
    String factorText = "Avg.",
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _richText(
          defaultText: defaultStatText,
          customizedTexts: textSpanList,
        ),
        const AppSpaceSizedBox(
          spaceHeight: 10,
        ),
        AppTextWidget(
          text: factorText,
          textStyle: AppTextStyling.defaultFontLight.copyWith(
            fontSize: 13,
            color: AppColors.themeWhite,
          ),
        ),
        const AppSpaceSizedBox(
          spaceHeight: 8,
        ),
        if (showPercentageStat) ...[
          _percentageComponent(
            valueText: percentageText,
            raised: isRaised,
          ),
        ],
      ],
    );
  }

  Text _richText({
    required String defaultText,
    required List<TextSpan> customizedTexts,
  }) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: defaultText,
            style: AppTextStyling.defaultFontBold
                .copyWith(fontSize: 21, color: AppColors.themeWhite),
          ),
          ...customizedTexts,
        ],
      ),
    );
  }

  Row _percentageComponent({
    required String valueText,
    required bool raised,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: raised ? AppColors.green200 : AppColors.red200,
              width: 2,
            ),
            color: raised ? AppColors.green50 : AppColors.red50,
          ),
          child: Row(
            children: [
              if (raised) ...[
                const AppSvgIcon(
                  svgIconPath: AppIcons.arrowUpIcon,
                  svgIconSize: 15,
                ),
              ] else ...[
                const AppSvgIcon(
                  svgIconPath: AppIcons.arrowDownIcon,
                  svgIconSize: 15,
                ),
              ],
              const AppSpaceSizedBox(
                spaceWidth: 3,
              ),
              AppTextWidget(
                text: valueText,
                textStyle: AppTextStyling.defaultFontMedium.copyWith(
                  fontSize: 14,
                  color: raised ? AppColors.darkGreen : AppColors.darkRed,
                ),
              ),
            ],
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }
}
