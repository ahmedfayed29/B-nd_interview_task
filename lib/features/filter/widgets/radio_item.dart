part of '../view.dart';

class _RadioItem extends StatelessWidget {
  final String title;
  final int value, group;
  final VoidCallback onTap;

  const _RadioItem(
      {super.key,
      required this.title,
      required this.value,
      required this.group,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: group,
          activeColor: AppColors.primary,
          onChanged: (value) => onTap(),
        ),
        AppText(
            title: title,
            color: AppColors.blackOlive,
            appTextStyle: AppTextStyle.subBody),
      ],
    );
  }
}
