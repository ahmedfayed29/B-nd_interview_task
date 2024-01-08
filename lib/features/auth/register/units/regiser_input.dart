part of '../view.dart';

class _RegisterInput extends StatelessWidget {
  const _RegisterInput({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.of(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AppTextField(
                fillColor: AppColors.textFieldBG.withOpacity(.03),
                borderColor: AppColors.textFieldBG.withOpacity(.03),
                label: tr('first_name'),
                controller: cubit.firstName,
                inputType: TextInputType.name,
                validator: (val) => Validator.name(val),
              ),
            ),
            SizedBox(
              width: 10.width,
            ),
            Expanded(
              child: AppTextField(
                fillColor: AppColors.textFieldBG.withOpacity(.03),
                borderColor: AppColors.textFieldBG.withOpacity(.03),
                label: tr('last_name'),
                controller: cubit.lastName,
                inputType: TextInputType.name,
                validator: (val) => Validator.name(val),
              ),
            )
          ],
        ),
        SizedBox(
          height: 24.height,
        ),
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
          trailing: InkWell(
            onTap: () => cubit.changeViewPassword(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(cubit.viewPassword
                    ? Icons.visibility
                    : Icons.visibility_off)
              ],
            ),
          ),
          secure: !cubit.viewPassword,
          label: tr('password'),
          controller: cubit.password,
          inputType: TextInputType.phone,
          validator: (val) => Validator.password(val),
        ),
        SizedBox(
          height: 16.height,
        ),
        AppTextField(
          fillColor: AppColors.textFieldBG.withOpacity(.03),
          borderColor: AppColors.textFieldBG.withOpacity(.03),
          trailing: InkWell(
            onTap: () => cubit.changeViewConfirmPassword(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(cubit.viewConfirmPassword
                    ? Icons.visibility
                    : Icons.visibility_off)
              ],
            ),
          ),
          secure: !cubit.viewConfirmPassword,
          label: tr('confirm_password'),
          controller: cubit.confirmPassword,
          inputType: TextInputType.phone,
          validator: (val) => Validator.passwordConfirmation(
              password: cubit.password.text, value: val),
        ),
        SizedBox(
          height: 16.height,
        ),
        _UserType(),
      ],
    );
  }
}
