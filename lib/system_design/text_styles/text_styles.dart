part of 'app_text_style.dart';

abstract class AppTextStyles {
  static AppTextStyle get header => AppTextStyle(
        fontSize: 18,
        fontWeight: _AppFontWeight.extraBold.value,
        height: 1.87,
      );

  static AppTextStyle get subHeader => AppTextStyle(
        fontSize: 16,
        fontWeight: _AppFontWeight.bold.value,
        height: 1.875,
      );
  static AppTextStyle get body => AppTextStyle(
        fontSize: 14,
        fontWeight: _AppFontWeight.medium.value,
        height: 1.87,
      );

  static AppTextStyle get subBody => AppTextStyle(
        fontSize: 12,
        fontWeight: _AppFontWeight.semiBold.value,
        height: 1.875,
      );
  static AppTextStyle get caption => AppTextStyle(
        fontSize: 10,
        fontWeight: _AppFontWeight.semiBold.value,
        height: 1.9,
      );
}
