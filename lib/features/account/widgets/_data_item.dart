part of '../view.dart';

class _DataItem extends StatelessWidget {
  final String title, image, value;

  const _DataItem(
      {super.key,
      required this.title,
      required this.image,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.height),
      padding: EdgeInsets.symmetric(horizontal: 12.width, vertical: 8.height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.gainsBoro,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            image,
            width: 24.width,
            height: 24.height,
          ),
          SizedBox(
            width: 12.width,
          ),
          AppText(
            title: title,
            color: AppColors.blackOlive,
            appTextStyle: AppTextStyle.body,
          ),
          Spacer(),
          AppText(
            title: value,
            color: AppColors.gray,
            appTextStyle: AppTextStyle.body,
          ),
        ],
      ),
    );
  }
}
