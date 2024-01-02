part of '../view.dart';

class _Time extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          title: DateFormat("yyyy-MM-dd", "en").format(DateTime.now()),
          color: AppColors.gray,
          textAlign: TextAlign.center,
          appTextStyle: AppTextStyle.body,
        ),
        AppText(
          title: DateFormat("hh:mm a", "en").format(DateTime.now()),
          color: AppColors.primary,
          textAlign: TextAlign.center,
          appTextStyle: AppTextStyle.subHeader,
        ),
      ],
    );
  }
}
