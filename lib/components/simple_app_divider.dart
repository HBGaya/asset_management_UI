import '/theme_constants/app_colors.dart';
import 'package:flutter/material.dart';

class SimpleAppDivider extends StatelessWidget {
  final double dividerThickness;
  final Color dividerColor;
  final bool showVertical;

  const SimpleAppDivider({
    Key? key,
    this.dividerThickness = 1.4,
    this.dividerColor = AppColors.themeGrey200,
    this.showVertical = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (showVertical) {
      return VerticalDivider(
        thickness: dividerThickness,
        color: dividerColor,
        width: 0,
      );
    } else {
      return Divider(
        thickness: dividerThickness,
        color: dividerColor,
      );
    }
  }
}
