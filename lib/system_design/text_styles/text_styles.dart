part of 'app_text_style.dart';

abstract class AppTextStyles {
  static AppTextStyle get displaySm => AppTextStyle(
        fontSize: 23,
        fontWeight: _AppFontWeight.bold.value,
        height: 25,
      );

  static AppTextStyle get displaySmSemiBold => AppTextStyle(
        fontSize: 23,
        fontWeight: _AppFontWeight.semiBold.value,
        height: 25,
      );

  static AppTextStyle get displaySmMedium => AppTextStyle(
        fontSize: 23,
        fontWeight: _AppFontWeight.medium.value,
        height: 25,
      );

  static AppTextStyle get displaySmRegular => AppTextStyle(
        fontSize: 23,
        fontWeight: _AppFontWeight.regular.value,
        height: 25,
      );

  static AppTextStyle get displayXsBold => AppTextStyle(
        fontSize: 18,
        fontWeight: _AppFontWeight.bold.value,
        height: 25,
      );

  static AppTextStyle get displayXsSemiBold => AppTextStyle(
        fontSize: 18,
        fontWeight: _AppFontWeight.semiBold.value,
        height: 20,
      );

  static AppTextStyle get displayXsMedium => AppTextStyle(
        fontSize: 18,
        fontWeight: _AppFontWeight.medium.value,
        height: 20,
      );

  static AppTextStyle get displayXsRegular => AppTextStyle(
        fontSize: 18,
        fontWeight: _AppFontWeight.regular.value,
        height: 25,
      );

  static AppTextStyle get textXlBold => AppTextStyle(
        fontSize: 16,
        fontWeight: _AppFontWeight.bold.value,
        height: 18,
      );

  static AppTextStyle get textXlSemiBold => AppTextStyle(
        fontSize: 16,
        fontWeight: _AppFontWeight.semiBold.value,
        height: 16,
      );

  static AppTextStyle get textXlMedium => AppTextStyle(
        fontSize: 16,
        fontWeight: _AppFontWeight.medium.value,
        height: 17,
      );

  static AppTextStyle get textXlRegular => AppTextStyle(
        fontSize: 16,
        fontWeight: _AppFontWeight.regular.value,
        height: 18,
      );
  static AppTextStyle get textLgBold => AppTextStyle(
        fontSize: 14,
        fontWeight: _AppFontWeight.bold.value,
        height: 15,
      );

  static AppTextStyle get textLgSemiBold => AppTextStyle(
        fontSize: 14,
        fontWeight: _AppFontWeight.semiBold.value,
        height: 15,
      );

  static AppTextStyle get textLgMedium => AppTextStyle(
        fontSize: 14,
        fontWeight: _AppFontWeight.medium.value,
        height: 15,
      );

  static AppTextStyle get textLgRegular => AppTextStyle(
        fontSize: 14,
        fontWeight: _AppFontWeight.regular.value,
        height: 15,
      );
  static AppTextStyle get textMdBold => AppTextStyle(
        fontSize: 12,
        fontWeight: _AppFontWeight.bold.value,
        height: 13,
      );

  static AppTextStyle get textMdSemiBold => AppTextStyle(
        fontSize: 12,
        fontWeight: _AppFontWeight.semiBold.value,
        height: 13,
      );

  static AppTextStyle get textMdMedium => AppTextStyle(
        fontSize: 12,
        fontWeight: _AppFontWeight.medium.value,
        height: 13,
      );

  static AppTextStyle get textMdRegular => AppTextStyle(
        fontSize: 12,
        fontWeight: _AppFontWeight.regular.value,
        height: 13,
      );
}
