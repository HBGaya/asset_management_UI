import 'package:asset_management_dashboard/riverpod_providers/state_providers.dart';
import 'package:asset_management_dashboard/theme_constants/app_themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/home_module/main_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  /// wrap with provider scope widget to access all providers globally
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = ref.watch(appThemeProvider);

    final themeData = switch (themeType) {
      AppThemeType.regularTheme => AppThemeColors.regularTheme,
      AppThemeType.galaxyTheme => AppThemeColors.galaxyTheme,
      AppThemeType.citrusTheme => AppThemeColors.citrusTheme
    };

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const MainHomeScreen(),
    );
  }
}
