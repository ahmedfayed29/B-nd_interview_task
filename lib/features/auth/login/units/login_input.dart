part of '../view.dart';

class _LoginInput extends StatelessWidget {
  const _LoginInput({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = LoginCubit.of(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextField(
            fillColor: AppColors.textFieldBG.withOpacity(.03),
            borderColor: AppColors.textFieldBG.withOpacity(.03),
            label: tr('email'),
            controller: cubit.email,
            inputType: TextInputType.emailAddress,
            validator: (val) => Validator.email(val),
          ),
          SizedBox(
            height: 16.height,
          ),
          AppTextField(
            fillColor: AppColors.textFieldBG.withOpacity(.03),
            borderColor: AppColors.textFieldBG.withOpacity(.03),
            validator: (val) => Validator.password(val),
            trailing: InkWell(
              onTap: () => cubit.changeViewPassword(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    cubit.viewPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.primary,
                  )
                ],
              ),
            ),
            secure: !cubit.viewPassword,
            label: tr('password'),
            controller: cubit.password,
            inputType: TextInputType.text,
          ),
          SizedBox(
            height: 16.height,
          ),
          Row(
            children: [
              Checkbox(
                  value: cubit.rememberMe,
                  activeColor: AppColors.primary,
                  onChanged: (val) => cubit.changeTerms()),
              AppText(
                  title: tr('remember_me'),
                  color: AppColors.gray,
                  appTextStyle: AppTextStyle.textMdSemiBold),
              Spacer(),
              AppText(
                  title: tr('forget_password'),
                  color: AppColors.gray,
                  appTextStyle: AppTextStyle.textMdSemiBold),
            ],
          )
        ],
      ),
    );
  }
}
