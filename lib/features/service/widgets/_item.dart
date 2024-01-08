part of '../view.dart';

class _Item extends StatelessWidget {
  final ServiceModel service;
  const _Item({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final cubit = ServiceCubit.of(context);
    return Container(
      width: 157.width,
      padding: EdgeInsets.symmetric(horizontal: 4.width, vertical: 4.height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          AppNetworkImage(
            url: service.mainImage,
            width: 151.width,
            height: 103.height,
            borderRadius: 8,
            fit: BoxFit.cover,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.width, vertical: 6.height),
                      margin: EdgeInsets.symmetric(
                          horizontal: 6.width, vertical: 6.height),
                      child: AppText(
                          title: '\$${service.price}',
                          color: AppColors.white,
                          appTextStyle: AppTextStyle.textMdSemiBold),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27),
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.height,
          ),
          AppText(
              title: service.title,
              color: AppColors.black,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              appTextStyle: AppTextStyle.textMdSemiBold),
          SizedBox(
            height: 10.height,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Res.star,
                width: 14.width,
                height: 14.height,
              ),
              SizedBox(
                width: 4.width,
              ),
              AppText(
                  title: '(${service.averageRating})',
                  color: AppColors.warning,
                  textAlign: TextAlign.center,
                  appTextStyle: AppTextStyle.textMdSemiBold),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 6.width),
                height: 10,
                width: 1,
                color: AppColors.gray300,
              ),
              SvgPicture.asset(
                Res.cart,
                width: 14.width,
                height: 14.height,
              ),
              SizedBox(
                width: 4.width,
              ),
              AppText(
                  title: '${service.completedSalesCount}',
                  color: AppColors.gray600,
                  textAlign: TextAlign.center,
                  appTextStyle: AppTextStyle.textMdRegular),
            ],
          )
        ],
      ),
    );
  }
}
