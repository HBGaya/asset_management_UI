import 'package:asset_management_dashboard/theme_constants/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final changeDuration = StateProvider<String>((ref) {
  return "Today";
});

final globalScaffold = StateProvider<GlobalKey<ScaffoldState>>((ref) {
  return GlobalKey<ScaffoldState>();
});

final appThemeProvider = StateProvider<AppThemeType>((ref) {
  return AppThemeType.regularTheme;
});
