part of '../view.dart';

class _TableHeader extends StatelessWidget {
  const _TableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.width, vertical: 14.height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.gray50,
      ),
      child: Row(
        children: [
          Expanded(
            child: AppText(
                textAlign: TextAlign.center,
                title: tr('country'),
                color: AppColors.gray500,
                appTextStyle: AppTextStyle.textMdBold),
          ),
          Expanded(
            child: AppText(
                textAlign: TextAlign.center,
                title: tr('capital'),
                color: AppColors.gray500,
                appTextStyle: AppTextStyle.textMdBold),
          )
        ],
      ),
    );
  }
}
