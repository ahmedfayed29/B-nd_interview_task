import 'package:flutter/material.dart';

part 'app_font_weight.dart';
part 'text_styles.dart';

class AppTextStyle {
  final double fontSize;
  final FontWeight fontWeight;
  final double height;

  const AppTextStyle({
    required this.fontSize,
    required this.fontWeight,
    required this.height,
  });

  static AppTextStyle get header => AppTextStyles.header;

  static AppTextStyle get subHeader => AppTextStyles.subHeader;
  static AppTextStyle get body => AppTextStyles.body;

  static AppTextStyle get subBody => AppTextStyles.subBody;
}
