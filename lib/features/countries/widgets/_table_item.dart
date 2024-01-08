part of '../view.dart';

class _TableItem extends StatelessWidget {
  final String title, value;
  const _TableItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.width, vertical: 14.height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppText(
                textAlign: TextAlign.center,
                title: title,
                color: AppColors.black,
                appTextStyle: AppTextStyle.textMdSemiBold),
          ),
          Expanded(
            child: AppText(
                textAlign: TextAlign.center,
                title: value,
                color: AppColors.black,
                appTextStyle: AppTextStyle.textMdSemiBold),
          )
        ],
      ),
    );
  }
}
