import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgIcon extends StatelessWidget {
  final String svgIconPath;
  final double? svgIconSize;
  final ColorFilter? colorFilter;

  const AppSvgIcon({
    Key? key,
    required this.svgIconPath,
    this.svgIconSize,
    this.colorFilter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgIconPath,
      width: svgIconSize,
      height: svgIconSize,
      colorFilter: colorFilter,
    );
  }
}
