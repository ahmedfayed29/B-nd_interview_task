part of '../view.dart';

class _CheckItem extends StatelessWidget {
  final String title;
  final bool value;
  final VoidCallback onTap;

  const _CheckItem(
      {super.key,
      required this.title,
      required this.value,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
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
