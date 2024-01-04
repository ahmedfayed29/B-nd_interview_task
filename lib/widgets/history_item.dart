import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_text.dart';

class HistoryWidget extends StatelessWidget {
  final VoidCallback onTap;
  const HistoryWidget({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.zero,
        shape: CircleBorder(),
        elevation: 10,
        color: AppColors.blizzardBlue,
        child: Container(
          width: 70.width,
          height: 70.height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: AppColors.blizzardBlue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Res.history,
                width: 24.width,
                height: 24.height,
              ),
              SizedBox(
                height: 4.height,
              ),
              AppText(
                  title: tr('history'),
                  color: AppColors.blackOlive,
                  appTextStyle: AppTextStyle.subBody)
            ],
          ),
        ),
      ),
    );
  }
}
