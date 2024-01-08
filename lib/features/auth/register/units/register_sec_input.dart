part of '../view.dart';

class _RegisterSecInput extends StatelessWidget {
  const _RegisterSecInput({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.of(context);
    return Column(
      children: [
        _UserImage(),
        SizedBox(
          height: 16.height,
        ),
        AppTextField(
          fillColor: AppColors.textFieldBG.withOpacity(.03),
          borderColor: AppColors.textFieldBG.withOpacity(.03),
          label: tr('about'),
          controller: cubit.about,
          inputType: TextInputType.multiline,
          maxLines: 3,
          validator: (val) => Validator.about(val),
        ),
        SizedBox(
          height: 16.height,
        ),
        _Salary(),
        SizedBox(
          height: 16.height,
        ),
        AppTextField(
          fillColor: AppColors.textFieldBG.withOpacity(.03),
          borderColor: AppColors.textFieldBG.withOpacity(.03),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Res.birthdate,
                width: 24.width,
                height: 24.height,
              ),
            ],
          ),
          label: tr('birthdate'),
          onTap: () => cubit.selectDate(),
          controller: cubit.birthdate,
          inputType: TextInputType.name,
          validator: (val) => Validator.empty(val),
        ),
        SizedBox(
          height: 16.height,
        ),
        _Gender(),
        SizedBox(
          height: 16.height,
        ),
        _Skills(),
        SizedBox(
          height: 16.height,
        ),
        _FavouriteMedia(),
      ],
    );
  }
}
