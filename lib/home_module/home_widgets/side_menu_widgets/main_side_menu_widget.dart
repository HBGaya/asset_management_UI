import 'package:asset_management_dashboard/components/simple_app_divider.dart';
import 'package:asset_management_dashboard/home_module/home_view_models/side_menu_view_model.dart';
import 'package:asset_management_dashboard/home_module/home_widgets/side_menu_widgets/theme_selection_widgets.dart';

import '../../../theme_constants/app_themes.dart';
import '/components/app_space_sized_box.dart';
import '/riverpod_providers/state_providers.dart';
import '/theme_constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainSideMenuWidget extends ConsumerWidget with ThemeSelectionWidgets {
  const MainSideMenuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeType = ref.watch(appThemeProvider);
    return Drawer(
      backgroundColor: Theme.of(context).cardColor.withValues(alpha: 0.85),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(25)),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                SideMenuViewModel(ref: ref).closeTheEndDrawer();
              },
              icon: Icon(
                Icons.close_rounded,
                color: Theme.of(context).shadowColor,
                size: 40,
              ),
            ),
          ),
          const AppSpaceSizedBox(
            spaceHeight: 100,
          ),

          /// shows theming options
          themeOptionRow(
              themeTitle: "Light", lightThemeColor: AppColors.themeWhite),
          SimpleAppDivider(
            dividerColor:
                _giveDividerColor(appTheme: appThemeType, context: context),
            dividerThickness: 1,
          ),
          themeOptionRow(
              themeTitle: "Galaxy", lightThemeColor: AppColors.mediumPurple),
          SimpleAppDivider(
            dividerColor:
                _giveDividerColor(appTheme: appThemeType, context: context),
            dividerThickness: 1,
          ),
          themeOptionRow(
              themeTitle: "Citrus", lightThemeColor: AppColors.primaryOrange),
        ],
      ),
    );
  }

  Color _giveDividerColor(
      {required AppThemeType appTheme, required BuildContext context}) {
    if (appTheme == AppThemeType.regularTheme) {
      return AppColors.themeGrey900.withValues(alpha: 0.3);
    } else {
      return Theme.of(context).dividerColor;
    }
  }
}
