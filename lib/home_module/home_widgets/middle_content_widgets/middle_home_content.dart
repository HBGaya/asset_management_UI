import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/components/app_svg_icon.dart';
import '/components/simple_app_divider.dart';
import '/home_module/home_widgets/middle_content_widgets/middle_home_widgets.dart';
import '/theme_constants/app_colors.dart';
import '/theme_constants/app_icons.dart';
import 'package:flutter/material.dart';

import '../../../components/app_space_sized_box.dart';
import '../../../theme_constants/app_text_styling.dart';

class MiddleHomeContent extends ConsumerWidget {
  const MiddleHomeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          const Positioned(
            right: -1,
            child: AppSvgIcon(
              svgIconPath: AppIcons.squarePatternIcon,
            ),
          ),
          Column(
            children: [
              MiddleHomeWidgets(buildContext: context).welcomeBackContent(),
              const AppSpaceSizedBox(
                spaceHeight: 10,
              ),
               SimpleAppDivider(
                dividerColor: Theme.of(context).dividerColor,
                dividerThickness: 1.2,
              ),
              MiddleHomeWidgets(buildContext: context).statisticWidget(
                mainHeadingText: "Average Late & Overtime",
                mainTextStat1: "25",
                mainTextStat2: "5",
                factorTextStat1: "Avg. Lateness",
                factorTextStat2: "Avg. Overtime",
                percentageTextStat1: "15%",
                percentageTextStat2: "15%",
                dividerColor: Theme.of(context).dividerColor,
                mainTextSpanStat1: [
                  TextSpan(
                    text: "\t\tMin",
                    style: AppTextStyling.defaultFontLight.copyWith(
                      fontSize: 14,
                      color: AppColors.themeWhite,
                    ),
                  ),
                ],
                mainTextSpanStat2: [
                  TextSpan(
                    text: "\tHr",
                    style: AppTextStyling.defaultFontLight.copyWith(
                      fontSize: 14,
                      color: AppColors.themeWhite,
                    ),
                  ),
                  TextSpan(
                    text: "\t15",
                    style: AppTextStyling.defaultFontBold.copyWith(
                      fontSize: 21,
                      color: AppColors.themeWhite,
                    ),
                  ),
                  TextSpan(
                    text: "\t\tMin",
                    style: AppTextStyling.defaultFontLight.copyWith(
                      fontSize: 14,
                      color: AppColors.themeWhite,
                    ),
                  ),
                ],
                isPercentageRaised1: false,
              ),
              const AppSpaceSizedBox(
                spaceHeight: 25,
              ),
              MiddleHomeWidgets(buildContext: context).statisticWidget(
                mainHeadingText: "Payroll Finance",
                mainTextStat1: "USD 43.30K\$",
                mainTextStat2: "USD 105.40K\$",
                factorTextStat1: "Total Processed",
                factorTextStat2: "Avg. Overtime",
                percentageTextStat1: "15%",
                percentageTextStat2: "15%",
                dividerColor: Theme.of(context).dividerColor,
              ),
              const AppSpaceSizedBox(
                spaceHeight: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: MiddleHomeWidgets(buildContext: context).statisticWidget(
                      mainHeadingText: "Activity",
                      mainTextStat1: "22",
                      mainTextStat2: "70",
                      factorTextStat1: "Avg. Leaves",
                      factorTextStat2: "Avg. Attendance",
                      showPercentageComponent1: false,
                      showPercentageComponent2: false,
                      dividerColor: Theme.of(context).dividerColor,
                    ),
                  ),
                  Expanded(
                    child: MiddleHomeWidgets(buildContext: context).statisticWidget(
                      mainHeadingText: "Head Count",
                      mainTextStat1: "1283",
                      mainTextStat2: "250",
                      factorTextStat1: "Total Employees",
                      factorTextStat2: "Total Internship",
                      showPercentageComponent1: false,
                      showPercentageComponent2: false,
                      dividerColor: Theme.of(context).dividerColor,
                    ),
                  ),
                ],
              ),
              const AppSpaceSizedBox(
                spaceHeight: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
