import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hr_app/core/bloc_providers/dependencies/dependencies_cubit.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/core/helpers/utils.dart';
import 'package:hr_app/core/helpers/validator.dart';
import 'package:hr_app/core/models/dependencies_model.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';
import 'package:hr_app/features/auth/register/register_cubit.dart';
import 'package:hr_app/features/nav_bar/view.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_button.dart';
import 'package:hr_app/widgets/app_text.dart';
import 'package:hr_app/widgets/app_text_field.dart';
import 'package:hr_app/widgets/drop_down_sheet.dart';

part 'second_register.dart';
part 'units/favourite_social_media.dart';
part 'units/gender.dart';
part 'units/regiser_header.dart';
part 'units/regiser_input.dart';
part 'units/register_sec_input.dart';
part 'units/salary.dart';
part 'units/skills.dart';
part 'units/user_type.dart';
part 'widgets/register_stepper.dart';
part 'widgets/user_image.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            final cubit = RegisterCubit.of(context);
            return ListView(
              padding: EdgeInsets.only(
                  left: 16.width,
                  right: 16.width,
                  bottom: 32.height,
                  top: 20 + Utils.topDevicePadding),
              children: [
                _RegisterHeader(),
                SizedBox(
                  height: 32.height,
                ),
                Form(key: cubit.formKey, child: _RegisterInput()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButton(
                      title: tr('next'),
                      borderColor: AppColors.primary,
                      onTap: () {
                        if (cubit.formKey.currentState!.validate()) {
                          if (cubit.userType == 0) {
                            Fluttertoast.showToast(msg: tr('select_user_type'));
                            return;
                          }
                          cubit.changeCurrentStep(step: 2);
                          RouteUtils.navigateTo(SecondRegister(
                            cubit: cubit,
                          ));
                        }
                      },
                      showArrow: true,
                      titleColor: AppColors.white,
                      color: AppColors.primary,
                      margin: EdgeInsets.only(top: 24.height),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
