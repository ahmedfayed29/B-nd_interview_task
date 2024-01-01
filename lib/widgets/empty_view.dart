import 'package:flutter/material.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_text.dart';

class EmptyView extends StatelessWidget {
  final String title;

  const EmptyView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
        title: title,
        color: AppColors.primary,
        appTextStyle: AppTextStyle.body,
        textAlign: TextAlign.center,
      ),
    );
  }
}
