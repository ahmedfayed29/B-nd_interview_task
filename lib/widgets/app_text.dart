import 'package:flutter/material.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';

class AppText extends StatelessWidget {
  final String title;
  final AppTextStyle appTextStyle;
  final Color color;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final String? fontFamily;

  AppText({
    Key? key,
    required this.title,
    required this.color,
    required this.appTextStyle,
    this.textAlign,
    this.decoration,
    this.overflow,
    this.maxLines,
    this.fontFamily,
    this.softWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: appTextStyle.fontSize,
        height: appTextStyle.fontSize / appTextStyle.height,
        decoration: decoration ?? TextDecoration.none,
        fontWeight: appTextStyle.fontWeight,
        fontFamily: fontFamily ?? 'lotta',
      ),
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}
