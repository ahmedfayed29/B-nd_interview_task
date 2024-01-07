import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/core/helpers/utils.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';
import 'package:hr_app/features/auth/login/login_cubit.dart';
import 'package:hr_app/features/auth/register/view.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_button.dart';
import 'package:hr_app/widgets/app_scaffold/app_scaffold.dart';
import 'package:hr_app/widgets/app_text.dart';
import 'package:hr_app/widgets/app_text_field.dart';

part 'units/login_header.dart';
part 'units/login_input.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                    EdgeInsets.only(top: 30.height + Utils.topDevicePadding),
                children: [
                  _LoginHeader(),
                  SizedBox(
                    height: 32.height,
                  ),
                  _LoginInput(),
                  AppButton(
                    title: tr('login'),
                    borderColor: AppColors.primary,
                    onTap: () => RouteUtils.navigateAndPopAll(AppScaffold()),
                    showArrow: true,
                    titleColor: AppColors.white,
                    color: AppColors.primary,
                    margin: EdgeInsets.symmetric(vertical: 24.height),
                  ),
                  InkWell(
                    onTap: () => RouteUtils.navigateTo(RegisterView()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                            title: tr("don't_have_account"),
                            color: AppColors.gray,
                            appTextStyle: AppTextStyle.textLgBold),
                        AppText(
                            title: " " + tr("register"),
                            color: AppColors.primary,
                            appTextStyle: AppTextStyle.textLgSemiBold),
                      ],
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                // image: DecorationImage(
                //   image: AssetImage(Res.background),
                //   fit: BoxFit.fill,
                // ),
              ),
            );
          },
        ),
      ),
    );
  }
}
