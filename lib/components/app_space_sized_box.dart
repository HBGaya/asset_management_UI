import 'package:flutter/material.dart';

class AppSpaceSizedBox extends StatelessWidget {
  final double? spaceWidth, spaceHeight;

  const AppSpaceSizedBox({Key? key, this.spaceWidth, this.spaceHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: spaceHeight,
      width: spaceWidth,
    );
  }
}
