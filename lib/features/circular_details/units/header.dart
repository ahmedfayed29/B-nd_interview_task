part of '../view.dart';

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              Res.circular_title,
              width: 24.width,
              height: 24.height,
            ),
            SizedBox(
              width: 10.width,
            ),
            AppText(
                title: 'عنوان  التعميم المرسل',
                color: AppColors.primary,
                appTextStyle: AppTextStyle.subHeader),
            Spacer(),
            AppText(
              title: tr('circular_number') + ": " + "123456",
              color: AppColors.blackOlive,
              appTextStyle: AppTextStyle.body,
            ),
          ],
        ),
        imageItem(
            title: tr('attachments'),
            value: 'اسم المرفق',
            image: Res.attachments,
            trailing: ''),
        SizedBox(
          height: 16.height,
        )
      ],
    );
  }

  Widget imageItem(
          {required String title,
          required String value,
          required String image,
          required String trailing}) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SvgPicture.asset(
            image,
            width: 24.width,
            height: 24.height,
          ),
          SizedBox(
            width: 6.width,
          ),
          AppText(
            title: title + ": " + value,
            color: AppColors.blackOlive,
            maxLines: 1,
            appTextStyle: AppTextStyle.body,
          ),
          Spacer(),
          AppText(
            title: trailing,
            color: AppColors.blackOlive,
            maxLines: 1,
            appTextStyle: AppTextStyle.body,
          ),
        ],
      );
}
