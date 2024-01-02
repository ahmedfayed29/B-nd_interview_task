part of '../view.dart';

class _LoginInput extends StatelessWidget {
  const _LoginInput({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = LoginCubit.of(context);
    return Column(
      children: [
        AppTextField(
          fillColor: AppColors.textFieldBG.withOpacity(.03),
          borderColor: AppColors.textFieldBG.withOpacity(.03),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Res.company_num,
                width: 24.width,
                height: 24.height,
              ),
            ],
          ),
          hint: tr('company_num'),
          controller: cubit.companyNum,
          inputType: TextInputType.phone,
        ),
        SizedBox(
          height: 24.height,
        ),
        AppTextField(
          fillColor: AppColors.textFieldBG.withOpacity(.03),
          borderColor: AppColors.textFieldBG.withOpacity(.03),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Res.branch_num,
                width: 24.width,
                height: 24.height,
              ),
            ],
          ),
          hint: tr('branch_num'),
          controller: cubit.branchNum,
          inputType: TextInputType.phone,
        ),
        SizedBox(
          height: 24.height,
        ),
        AppTextField(
          fillColor: AppColors.textFieldBG.withOpacity(.03),
          borderColor: AppColors.textFieldBG.withOpacity(.03),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Res.user,
                width: 24.width,
                height: 24.height,
              ),
            ],
          ),
          hint: tr('user_name'),
          controller: cubit.userName,
          inputType: TextInputType.phone,
        ),
        SizedBox(
          height: 24.height,
        ),
        AppTextField(
          fillColor: AppColors.textFieldBG.withOpacity(.03),
          borderColor: AppColors.textFieldBG.withOpacity(.03),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Res.lock,
                width: 24.width,
                height: 24.height,
              ),
            ],
          ),
          hint: tr('password'),
          controller: cubit.password,
          inputType: TextInputType.phone,
        ),
        SizedBox(
          height: 16.height,
        ),
        Row(
          children: [
            Checkbox(
                value: cubit.acceptTerms,
                activeColor: AppColors.primary,
                onChanged: (val) => cubit.changeTerms()),
            AppText(
                title: tr('accept_terms'),
                color: AppColors.primary,
                appTextStyle: AppTextStyle.subBody)
          ],
        )
      ],
    );
  }
}
