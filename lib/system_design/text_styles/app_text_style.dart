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

  static AppTextStyle get displaySm => AppTextStyles.displaySm;

  static AppTextStyle get displaySmSemiBold => AppTextStyles.displaySmSemiBold;

  static AppTextStyle get displaySmMedium => AppTextStyles.displaySmMedium;

  static AppTextStyle get displaySmRegular => AppTextStyles.displaySmRegular;

  static AppTextStyle get displayXsBold => AppTextStyles.displayXsBold;

  static AppTextStyle get displayXsSemiBold => AppTextStyles.displayXsSemiBold;

  static AppTextStyle get displayXsMedium => AppTextStyles.displayXsMedium;

  static AppTextStyle get displayXsRegular => AppTextStyles.displayXsRegular;

  static AppTextStyle get textXlBold => AppTextStyles.textXlBold;

  static AppTextStyle get textXlSemiBold => AppTextStyles.textXlSemiBold;

  static AppTextStyle get textXlMedium => AppTextStyles.textXlMedium;

  static AppTextStyle get textXlRegular => AppTextStyles.textXlRegular;
  static AppTextStyle get textLgBold => AppTextStyles.textLgBold;

  static AppTextStyle get textLgSemiBold => AppTextStyles.textLgSemiBold;

  static AppTextStyle get textLgMedium => AppTextStyles.textLgMedium;

  static AppTextStyle get textLgRegular => AppTextStyles.textLgRegular;
  static AppTextStyle get textMdBold => AppTextStyles.textMdBold;

  static AppTextStyle get textMdSemiBold => AppTextStyles.textMdSemiBold;

  static AppTextStyle get textMdMedium => AppTextStyles.textMdMedium;

  static AppTextStyle get textMdRegular => AppTextStyles.textMdRegular;
}
