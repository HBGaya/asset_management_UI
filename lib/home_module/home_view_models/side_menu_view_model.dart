import 'package:asset_management_dashboard/riverpod_providers/state_providers.dart';
import 'package:asset_management_dashboard/theme_constants/app_themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideMenuViewModel {
  final WidgetRef ref;

  SideMenuViewModel({required this.ref});

  void changeAppTheme({required String themeTitle}) {
    if (themeTitle == "Galaxy") {
      ref.read(appThemeProvider.notifier).state = AppThemeType.galaxyTheme;
      closeTheEndDrawer();
    } else if (themeTitle == "Citrus") {
      ref.read(appThemeProvider.notifier).state = AppThemeType.citrusTheme;
      closeTheEndDrawer();
    } else {
      ref.read(appThemeProvider.notifier).state = AppThemeType.regularTheme;
      closeTheEndDrawer();
    }
  }

  void closeTheEndDrawer() {
    final scaffoldKey = ref.read(globalScaffold);
    scaffoldKey.currentState?.closeEndDrawer();
  }
}
