import 'package:asset_management_dashboard/home_module/home_widgets/side_menu_widgets/main_side_menu_widget.dart';
import 'package:asset_management_dashboard/riverpod_providers/state_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme_constants/app_themes.dart';
import '/home_module/home_widgets/bottom_content_widgets/bottom_home_content.dart';
import '/home_module/home_widgets/middle_content_widgets/middle_home_content.dart';

import '/home_module/home_widgets/top_content_widgets/top_home_content.dart';

import '/theme_constants/app_colors.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends ConsumerWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final globalScaffoldKey = ref.watch(globalScaffold);
    final appThemeType = ref.watch(appThemeProvider);
    return Scaffold(
      key: globalScaffoldKey,
      backgroundColor: AppColors.themeWhite,

      /// Will show a side menu for selecting different themes
      endDrawer: const MainSideMenuWidget(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: _mainBackgroundColor(themeType: appThemeType),
        )),
        child: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 35,
            ),
            children: const [
              /// Will show the top most part of the screen
              TopHomeContent(),

              /// Will show the blue card on the screen
              MiddleHomeContent(),

              /// Will show the bottom white card on the screen
              BottomHomeContent(),
            ],
          ),
        ),
      ),
    );
  }

  List<Color> _mainBackgroundColor({required AppThemeType themeType}) {
    if (themeType == AppThemeType.galaxyTheme) {
      return [AppColors.softIndigo, AppColors.primaryIndigo];
    } else if (themeType == AppThemeType.citrusTheme) {
      return [AppColors.offWhiteCream, AppColors.primaryOrange];
    } else {
      return [AppColors.themeWhite, AppColors.themeWhite];
    }
  }
}
