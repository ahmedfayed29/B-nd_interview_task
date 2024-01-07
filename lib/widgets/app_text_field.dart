import 'package:flutter/material.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_text.dart';

import '../core/helpers/utils.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.hint,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.onTap,
    this.trailing,
    this.prefix,
    this.label,
    this.maxLines = 1,
    this.borderColor = AppColors.primary,
    this.fillColor = Colors.transparent,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.secure = false,
    this.underlineBorder = false,
    this.radius,
  });

  final String? hint;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  final TextInputType inputType;
  final VoidCallback? onTap;
  final Widget? trailing, prefix;
  final String? label;
  final int maxLines;
  final Color borderColor;
  final Color fillColor;
  final bool secure, underlineBorder;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final double? radius;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: EdgeInsets.only(bottom: 8.height),
            child: AppText(
              title: widget.label!,
              color: AppColors.gray,
              appTextStyle: AppTextStyle.textMdSemiBold,
            ),
          ),
        InkWell(
          radius: _radius,
          onTap: widget.onTap != null
              ? () {
                  Utils.dismissKeyboard();
                  widget.onTap!();
                }
              : null,
          borderRadius: BorderRadius.circular(_radius),
          child: AbsorbPointer(
            absorbing: widget.onTap != null,
            child: TextFormField(
              controller: widget.controller,
              cursorColor: AppColors.primary,
              validator: widget.validator,
              onChanged: widget.onChanged,
              textInputAction: TextInputAction.done,
              keyboardType: widget.inputType,
              maxLines: widget.maxLines,
              onSaved: widget.onSaved,
              obscureText: widget.secure,
              decoration: InputDecoration(
                // label: AppText(
                //   title: widget.label ?? '',
                //   color: AppColors.color2,
                //   appTextStyle: AppTextStyle.title,
                // ),
                hintText: widget.hint,
                fillColor: widget.fillColor,
                filled: true,
                // hintStyle: TextStyle(
                //     color: AppColors.gray,
                //     fontSize: AppTextStyle.textMdSemiBold.fontSize,
                //     fontWeight: AppTextStyle.textMdSemiBold.fontWeight,
                //     height: AppTextStyle.textMdSemiBold.height,
                //     fontFamily: 'lotta'),
                suffixIcon: widget.trailing,
                prefixIcon: widget.prefix,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.width, vertical: 12.height),
                border: widget.underlineBorder
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.blizzardBlue))
                    : widget.radius != null
                        ? _borderRadius(widget.borderColor,
                            radius: widget.radius)
                        : _border(widget.borderColor),
                enabledBorder: widget.underlineBorder
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.blizzardBlue))
                    : widget.radius != null
                        ? _borderRadius(widget.borderColor,
                            radius: widget.radius)
                        : _border(widget.borderColor),
                focusedBorder: widget.underlineBorder
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.blizzardBlue))
                    : widget.radius != null
                        ? _borderRadius(AppColors.primary,
                            radius: widget.radius, width: 1)
                        : _border(AppColors.primary, width: 1),
                errorBorder: widget.radius != null
                    ? _borderRadius(AppColors.primary, radius: widget.radius)
                    : _border(AppColors.primary),
                focusedErrorBorder: widget.radius != null
                    ? _borderRadius(AppColors.primary,
                        radius: widget.radius, width: 1)
                    : _border(AppColors.primary, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  InputBorder _borderRadius(Color color, {double width = 0.5, double? radius}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 8),
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }

  InputBorder _border(Color color, {double width = 0.5}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }

  double get _radius => 15;
}
