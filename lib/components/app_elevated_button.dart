import 'package:flutter/material.dart';

import '../theme_constants/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  final Color btnBackgroundColor, btnBorderColor;
  final VoidCallback? onPressedAction;
  final Widget? btnWidget;
  final double btnHeight, btnElevation, btnBorderRadius;

  const AppElevatedButton({
    Key? key,
    this.btnBackgroundColor = AppColors.themeWhite,
    this.onPressedAction,
    this.btnBorderColor = AppColors.transparentColor,
    this.btnHeight = 45,
    this.btnElevation = 3,
    this.btnBorderRadius = 5,
    this.btnWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: btnHeight,
      child: ElevatedButton(
        onPressed: onPressedAction,
        child: btnWidget,
      ),
    );
  }
}
