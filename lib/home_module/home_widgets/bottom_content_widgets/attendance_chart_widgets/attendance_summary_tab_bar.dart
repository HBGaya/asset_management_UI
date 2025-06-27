import 'package:asset_management_dashboard/riverpod_providers/state_providers.dart';
import 'package:asset_management_dashboard/theme_constants/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../components/app_text_widget.dart';
import '../../../../components/simple_app_divider.dart';
import '../../../../theme_constants/app_colors.dart';
import '../../../../theme_constants/app_text_styling.dart';

class AttendanceSummaryTabBar extends ConsumerWidget {
  const AttendanceSummaryTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// we'll here the changes to the selecting of duration here
    final selectedDuration = ref.watch(changeDuration);

    final appThemeType = ref.watch(appThemeProvider);

    return Container(
      height: 43,
      margin: const EdgeInsets.only(
        right: 20,
      ),
      padding: const EdgeInsets.symmetric(
        // vertical: 12,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: _giveBorderColor(appTheme: appThemeType, context: context),
          width: 1.5,
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _durationOptionWidget(
                selectedOption: selectedDuration,
                optionTitle: "Today",
                reference: ref),
            SimpleAppDivider(
              showVertical: true,
              dividerColor:
                  _giveBorderColor(appTheme: appThemeType, context: context),
              dividerThickness: 1.2,
            ),
            _durationOptionWidget(
                selectedOption: selectedDuration,
                optionTitle: "This Week",
                reference: ref),
            SimpleAppDivider(
              showVertical: true,
              dividerColor:
                  _giveBorderColor(appTheme: appThemeType, context: context),
              dividerThickness: 1.2,
            ),
            _durationOptionWidget(
                selectedOption: selectedDuration,
                optionTitle: "This Month",
                reference: ref),
          ],
        ),
      ),
    );
  }

  InkWell _durationOptionWidget({
    required String selectedOption,
    required String optionTitle,
    required WidgetRef reference,
  }) {
    final appTheme = reference.watch(appThemeProvider);
    return InkWell(
      onTap: () {
        reference.read(changeDuration.notifier).state = optionTitle;
      },
      child: Container(
        color: selectedOption == optionTitle
            ? _selectedColor(appTheme: appTheme)
            : AppColors.transparentColor,
        child: AppTextWidget(
          text: optionTitle,
          textAlignment: TextAlign.center,
          textStyle: AppTextStyling.defaultFontSemiBold.copyWith(
            fontSize: 16,
            color: selectedOption == optionTitle
                ? _selectedTextColor(appTheme: appTheme)
                : AppColors.themeGrey700,
          ),
        ),
      ),
    );
  }

  Color _selectedColor({required AppThemeType appTheme}) {
    if (appTheme == AppThemeType.galaxyTheme) {
      return AppColors.purpleAccent;
    } else {
      return AppColors.paleOrange;
    }
  }

  Color _selectedTextColor({required AppThemeType appTheme}) {
    if (appTheme == AppThemeType.galaxyTheme) {
      return AppColors.deepIndigo;
    } else {
      return AppColors.orange;
    }
  }

  Color _giveBorderColor(
      {required AppThemeType appTheme, required BuildContext context}) {
    if (appTheme == AppThemeType.regularTheme) {
      return AppColors.themeGrey300;
    } else {
      return Theme.of(context).dividerColor.withValues(alpha: 0.7);
    }
  }
}
