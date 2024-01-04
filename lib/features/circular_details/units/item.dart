part of '../view.dart';

class _Item extends StatelessWidget {
  final String title, desc;

  const _Item({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
            title: title,
            color: AppColors.gray,
            appTextStyle: AppTextStyle.body),
        Container(
          margin: EdgeInsets.only(top: 6.height),
          padding:
              EdgeInsets.symmetric(horizontal: 16.width, vertical: 16.height),
          child: AppText(
              title: desc,
              color: AppColors.gray,
              appTextStyle: AppTextStyle.body),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: 16.height,
        ),
      ],
    );
  }
}
