import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Res.logo,
              width: 184.width,
              height: 190.height,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 48.height,
            ),
            AppText(
                title: tr('insert_domain'),
                color: AppColors.primary,
                textAlign: TextAlign.center,
                appTextStyle: AppTextStyle.subHeader)
          ],
        ),
        decoration: BoxDecoration(color: AppColors.white),
      ),
    );
  }
}
