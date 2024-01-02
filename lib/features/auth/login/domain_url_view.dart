import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/core/helpers/utils.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';
import 'package:hr_app/features/auth/login/login_cubit.dart';
import 'package:hr_app/features/auth/login/view.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_button.dart';
import 'package:hr_app/widgets/app_text.dart';
import 'package:hr_app/widgets/app_text_field.dart';

class DomainUrlView extends StatelessWidget {
  const DomainUrlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            final cubit = LoginCubit.of(context);
            return Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16.width),
              child: ListView(
                padding:
                    EdgeInsets.only(top: 140.height + Utils.topDevicePadding),
                children: [
                  Center(
                    child: Image.asset(
                      Res.logo,
                      width: 184.width,
                      height: 190.height,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 48.height,
                  ),
                  AppText(
                      title: tr('insert_domain'),
                      color: AppColors.primary,
                      textAlign: TextAlign.center,
                      appTextStyle: AppTextStyle.subHeader),
                  SizedBox(
                    height: 32.height,
                  ),
                  AppTextField(
                    fillColor: AppColors.textFieldBG.withOpacity(.03),
                    borderColor: AppColors.textFieldBG.withOpacity(.03),
                    prefix: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Res.link,
                          width: 24.width,
                          height: 24.height,
                        ),
                      ],
                    ),
                    inputType: TextInputType.url,
                    hint: tr('url'),
                    controller: cubit.url,
                  ),
                  AppButton(
                    title: tr('next'),
                    borderColor: AppColors.primary,
                    onTap: () => RouteUtils.navigateTo(LoginView()),
                    showArrow: true,
                    titleColor: AppColors.white,
                    color: AppColors.primary,
                    margin: EdgeInsets.only(top: 24.height),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                image: DecorationImage(
                  image: AssetImage(Res.background),
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
