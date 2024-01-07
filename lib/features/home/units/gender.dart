part of '../view.dart';

class _Gender extends StatelessWidget {
  const _Gender({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
            title: tr('gender'),
            color: AppColors.gray500,
            appTextStyle: AppTextStyle.textMdSemiBold),
        Row(
          children: [
            radioItem(
              title: tr('male'),
              value: 0,
              group: cubit.gender,
            ),
            radioItem(
              title: tr('female'),
              value: 1,
              group: cubit.gender,
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
