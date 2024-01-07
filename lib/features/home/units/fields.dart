part of '../view.dart';

class _Fields extends StatelessWidget {
  const _Fields({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.of(context);
    return Column(
      children: [
        _UserImage(),
        Row(
          children: [
            Expanded(
              child: AppTextField(
                onTap: () {},
                fillColor: AppColors.textFieldBG.withOpacity(.03),
                borderColor: AppColors.textFieldBG.withOpacity(.03),
                label: tr('first_name'),
                controller: cubit.firstName,
                inputType: TextInputType.name,
              ),
            ),
            SizedBox(
              width: 10.width,
            ),
            Expanded(
              child: AppTextField(
                onTap: () {},
                fillColor: AppColors.textFieldBG.withOpacity(.03),
                borderColor: AppColors.textFieldBG.withOpacity(.03),
                label: tr('last_name'),
                controller: cubit.lastName,
                inputType: TextInputType.name,
              ),
            )
          ],
        ),
        SizedBox(
          height: 24.height,
        ),
        AppTextField(
          onTap: () {},
          fillColor: AppColors.textFieldBG.withOpacity(.03),
          borderColor: AppColors.textFieldBG.withOpacity(.03),
          label: tr('email'),
          controller: cubit.email,
          inputType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: 16.height,
        ),
        SizedBox(
          height: 16.height,
        ),
        SizedBox(
          height: 16.height,
        ),
        _UserType(),
        SizedBox(
          height: 16.height,
        ),
        AppTextField(
          onTap: () {},
          fillColor: AppColors.textFieldBG.withOpacity(.03),
          borderColor: AppColors.textFieldBG.withOpacity(.03),
          label: tr('about'),
          controller: cubit.about,
          inputType: TextInputType.multiline,
          maxLines: 3,
        ),
        SizedBox(
          height: 16.height,
        ),
        AppTextField(
          onTap: () {},
          fillColor: AppColors.textFieldBG.withOpacity(.03),
          borderColor: AppColors.textFieldBG.withOpacity(.03),
          label: tr('salary'),
          controller: cubit.salary,
          inputType: TextInputType.none,
          maxLines: 1,
        ),
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
          onTap: () {},
          controller: cubit.birthdate,
          inputType: TextInputType.name,
        ),
        SizedBox(
          height: 16.height,
        ),
        _Gender(),
        SizedBox(
          height: 16.height,
        ),
        _FavouriteMedia(),
      ],
    );
  }
}
