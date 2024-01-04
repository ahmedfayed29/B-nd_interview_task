part of '../view.dart';

class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.height, horizontal: 16.width),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageItem(
              title: tr('date'),
              value: '12/05/2023',
              image: Res.calender,
              trailing: tr('circular_number') + ": " + "123456"),
          SizedBox(
            height: 12.height,
          ),
          Row(
            children: [
              SvgPicture.asset(
                Res.circular_title,
                width: 24.width,
                height: 24.height,
              ),
              SizedBox(
                width: 6.width,
              ),
              AppText(
                title: 'عنوان التعميم المرسل',
                color: AppColors.blackOlive,
                maxLines: 1,
                appTextStyle: AppTextStyle.body,
              ),
            ],
          ),
          SizedBox(
            height: 12.height,
          ),
          AppText(
            title:
                'لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه ... بروشور او فلاير على سبيل المثال ... او نماذج مواقع انترنت ...',
            color: AppColors.gray,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            appTextStyle: AppTextStyle.body,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppText(
                title: tr("details"),
                appTextStyle: AppTextStyle.body,
                color: AppColors.cobaltBlue,
              ),
            ],
          ),
          imageItem(
              title: tr('attachments'),
              value: 'اسم المرفق',
              image: Res.attachments,
              trailing: ''),
        ],
      ),
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
