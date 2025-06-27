import '/theme_constants/app_text_styling.dart';
import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlignment;
  final int? maxOverFlowLines;

  const AppTextWidget({
    Key? key,
    required this.text,
    this.textStyle = AppTextStyling.defaultFont,
    this.textAlignment = TextAlign.start,
    this.maxOverFlowLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: textAlignment,
    );
  }
}
