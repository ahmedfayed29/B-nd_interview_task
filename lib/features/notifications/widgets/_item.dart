part of '../view.dart';

class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.height, horizontal: 8.width),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 16.width,
            height: 16.height,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColors.blizzardBlue),
          ),
          SizedBox(
            width: 8.width,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      title: 'اشعار رقم 1',
                      color: AppColors.primary,
                      maxLines: 1,
                      appTextStyle: AppTextStyle.body,
                    ),
                    AppText(
                      title: '20:21',
                      color: AppColors.gray,
                      maxLines: 1,
                      appTextStyle: AppTextStyle.caption,
                    ),
                  ],
                ),
                AppText(
                  title: 'لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم ',
                  color: AppColors.gray,
                  maxLines: 2,
                  appTextStyle: AppTextStyle.subBody,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
