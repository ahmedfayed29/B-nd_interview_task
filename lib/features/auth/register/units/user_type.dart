part of '../view.dart';

class _UserType extends StatelessWidget {
  const _UserType({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
            title: tr('user_type'),
            color: AppColors.gray500,
            appTextStyle: AppTextStyle.textMdSemiBold),
        Row(
          children: [
            radioItem(
              title: tr('seller'),
              value: 1,
              group: cubit.userType,
              onTap: () => cubit.changeUserType(value: 1),
            ),
            radioItem(
              title: tr('buyer'),
              value: 2,
              group: cubit.userType,
              onTap: () => cubit.changeUserType(value: 2),
            ),
            radioItem(
              title: tr('both'),
              value: 3,
              group: cubit.userType,
              onTap: () => cubit.changeUserType(value: 3),
            ),
          ],
        )
      ],
    );
  }

  Widget radioItem(
          {required String title,
          required int value,
          required int group,
          required VoidCallback onTap}) =>
      Row(
        children: [
          Radio(
              value: value,
              activeColor: AppColors.primary,
              groupValue: group,
              onChanged: (val) => onTap()),
          AppText(
              title: title,
              color: AppColors.black,
              appTextStyle: AppTextStyle.textLgSemiBold),
        ],
      );
}
