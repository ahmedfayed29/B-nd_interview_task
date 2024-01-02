part of '../app_scaffold.dart';

class _AppBarUser extends StatelessWidget {
  const _AppBarUser();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 64.width,
          height: 64.height,
          child: AppNetworkImage(
            url: 'https://www.topgear.com/sites/default/files/2023/05/image'
                '.jpg',
            width: 64.width,
            height: 64.height,
            shape: BoxShape.circle,
            borderColor: AppColors.white,
            fit: BoxFit.cover,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.white, width: 2),
          ),
        ),
        SizedBox(
          width: 8.width,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                  title: tr('hello') + "ahmed fayed",
                  color: AppColors.white,
                  appTextStyle: AppTextStyle.subHeader),
              AppText(
                  title: "شركة الجيل السابع",
                  color: AppColors.white,
                  appTextStyle: AppTextStyle.body),
              AppText(
                  title: tr('device_num') + " ffcc5548ss54-461",
                  color: AppColors.white,
                  appTextStyle: AppTextStyle.subBody),
            ],
          ),
        )
      ],
    );
  }
}
