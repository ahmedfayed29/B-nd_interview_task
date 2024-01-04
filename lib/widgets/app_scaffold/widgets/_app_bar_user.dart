import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_network_image.dart';
import 'package:hr_app/widgets/app_text.dart';

class AppBarUser extends StatelessWidget {
  final Color? titleColor, companyColor, deviceColor;

  const AppBarUser({this.titleColor, this.companyColor, this.deviceColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 64.width,
          height: 64.height,
          child: AppNetworkImage(
            url: 'https://www.topgear.com/sites/default/files/2023/05/image'
                '.jpg',
            width: 64.width,
            height: 64.height,
            shape: BoxShape.circle,
            borderColor: AppColors.white,
            fit: BoxFit.cover,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.white, width: 2),
          ),
        ),
        SizedBox(
          width: 8.width,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                  title: tr('hello') + "ahmed fayed",
                  color: titleColor ?? AppColors.white,
                  appTextStyle: AppTextStyle.subHeader),
              AppText(
                  title: "شركة الجيل السابع",
                  color: companyColor ?? AppColors.white,
                  appTextStyle: AppTextStyle.body),
              AppText(
                  title: tr('device_num') + " ffcc5548ss54-461",
                  color: deviceColor ?? AppColors.white,
                  appTextStyle: AppTextStyle.subBody),
            ],
          ),
        )
      ],
    );
  }
}
