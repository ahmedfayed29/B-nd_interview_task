part of '../view.dart';

class _HeaderItem extends StatelessWidget {
  final bool selected;
  final String title;
  final VoidCallback onTap;

  const _HeaderItem(
      {super.key,
      required this.selected,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: AppText(
            title: title,
            color: AppColors.white.withOpacity(selected ? 1 : .5),
            appTextStyle: AppTextStyle.body),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: selected ? AppColors.white : Colors.transparent,
        ))),
      ),
    );
  }
}
