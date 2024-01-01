part of 'app_text_style.dart';

enum _AppFontWeight {
  regular(FontWeight.w400),
  medium(FontWeight.w400),
  semiBold(FontWeight.w500),
  bold(FontWeight.w700),
  extraBold(FontWeight.w800);

  const _AppFontWeight(this.value);
  final FontWeight value;
}
