part of '../view.dart';

class _UserType extends StatelessWidget {
  const _UserType({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.of(context);
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
            ),
            radioItem(
              title: tr('buyer'),
              value: 2,
              group: cubit.userType,
            ),
            radioItem(
              title: tr('both'),
              value: 3,
              group: cubit.userType,
            ),
          ],
        )
      ],
    );
  }

  Widget radioItem({
    required String title,
    required int value,
    required int group,
  }) =>
      Row(
        children: [
          Radio(
              value: value,
              activeColor: AppColors.primary,
              groupValue: group,
              onChanged: (val) => null),
          AppText(
              title: title,
              color: AppColors.black,
              appTextStyle: AppTextStyle.textLgSemiBold),
        ],
      );
}
