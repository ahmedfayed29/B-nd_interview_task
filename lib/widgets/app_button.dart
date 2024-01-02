import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/core/helpers/utils.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_text.dart';

import 'app_loading_indicator.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.color = AppColors.primary,
    this.borderColor = AppColors.primary,
    this.titleColor = AppColors.white,
    this.onTap,
    this.margin = EdgeInsets.zero,
    this.padding,
    this.height,
    this.titleFontSize = 16,
    this.isLoading = false,
    this.showArrow = false,
    this.textDecoration = TextDecoration.none,
  });

  final String title;
  final Color color;
  final Color borderColor;
  final Color titleColor;
  final VoidCallback? onTap;
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final double? height;
  final double titleFontSize;
  final bool isLoading, showArrow;
  final TextDecoration textDecoration;

  double get _radius => 10;

  factory AppButton.outline({
    required String title,
    Color color = AppColors.primary,
    Color titleColor = AppColors.black,
    VoidCallback? onTap,
    bool isLoading = false,
  }) {
    return _OutlineAppButton(
      title: title,
      onTap: onTap,
      color: color,
      titleColor: titleColor,
      isLoading: isLoading,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: isLoading
          ? AppLoadingIndicator()
          : InkWell(
              onTap: () {
                if (onTap != null) {
                  onTap!();
                  Utils.dismissKeyboard();
                }
              },
              radius: _radius,
              borderRadius: BorderRadius.circular(_radius),
              child: Container(
                height: height ?? 58.height,
                padding: padding ?? EdgeInsets.symmetric(horizontal: 24.width),
                constraints: BoxConstraints(
                  minWidth: 160.width,
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      title: title,
                      color: titleColor,
                      decoration: textDecoration,
                      appTextStyle: AppTextStyle.subHeader,
                    ),
                    Visibility(
                      visible: showArrow,
                      child: SizedBox(
                        width: 8.width,
                      ),
                    ),
                    Visibility(
                      visible: showArrow,
                      child: Transform(
                        transform: Matrix4.rotationY(Utils.isAR ? pi : 0),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          Res.arrow_next,
                          width: 24.width,
                          height: 24.height,
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(_radius),
                  color: onTap == null ? AppColors.primary : color,
                ),
              ),
            ),
    );
  }
}

class _OutlineAppButton extends AppButton {
  _OutlineAppButton({
    required super.title,
    super.onTap,
    super.color = AppColors.primary,
    super.titleColor = AppColors.black,
    required super.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      radius: _radius,
      borderRadius: BorderRadius.circular(_radius),
      child: Container(
        height: 48.height,
        alignment: Alignment.center,
        child: AppText(
          title: title,
          color: onTap == null ? AppColors.white : titleColor,
          appTextStyle: AppTextStyle.subHeader,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_radius),
            color: AppColors.white,
            border: Border.all(
              color: onTap == null ? AppColors.primary : AppColors.primary,
              width: 1,
            )),
      ),
    );
  }
}
