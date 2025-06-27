import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../riverpod_providers/state_providers.dart';
import '../../../theme_constants/app_themes.dart';
// import 'attendance_chart_widgets/attendance_chart_widget.dart';

import '/home_module/home_widgets/bottom_content_widgets/bottom_home_widgets.dart';
import 'package:flutter/material.dart';

import '../../../components/simple_app_divider.dart';
import '../../../theme_constants/app_colors.dart';

class BottomHomeContent extends ConsumerWidget {
  const BottomHomeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeType = ref.watch(appThemeProvider);

    return Container(
      margin: const EdgeInsets.only(
        top: 45,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: AppColors.themeGrey200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            /// give shadow color according to selected themes
            color: _giveShadowColor(appTheme: appThemeType, context: context),
            blurRadius: 4.0,
            spreadRadius: 3,
            offset: const Offset(0, 0), // shadow direction: bottom right
          ),
        ],
      ),
      child: Column(
        children: [
          BottomHomeWidgets(appTheme: appThemeType)
              .attendanceSummaryComponent(),
          SimpleAppDivider(
            dividerColor:
                _giveDividerColor(appTheme: appThemeType, context: context),
            dividerThickness: 1.3,
          ),
          // const AttendanceChartWidget(),
          SimpleAppDivider(
            dividerColor:
                _giveDividerColor(appTheme: appThemeType, context: context),
            dividerThickness: 1.3,
          ),
          BottomHomeWidgets(appTheme: appThemeType).learnMoreContent(),
        ],
      ),
    );
  }

  Color _giveShadowColor(
      {required AppThemeType appTheme, required BuildContext context}) {
    if (appTheme == AppThemeType.regularTheme) {
      return AppColors.themeGrey200;
    } else {
      return Theme.of(context).shadowColor.withValues(alpha: 0.3);
    }
  }

  Color _giveDividerColor(
      {required AppThemeType appTheme, required BuildContext context}) {
    if (appTheme == AppThemeType.regularTheme) {
      return AppColors.themeGrey200;
    } else {
      return Theme.of(context).dividerColor.withValues(alpha: 0.3);
    }
  }
}
