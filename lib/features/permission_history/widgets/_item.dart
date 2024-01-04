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
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset(Res.login_time),
                        SizedBox(
                          width: 6.width,
                        ),
                        Expanded(
                          child: AppText(
                            title: tr('from_time') + ": " + "10:30",
                            color: AppColors.blackOlive,
                            maxLines: 1,
                            appTextStyle: AppTextStyle.body,
                          ),
                        ),
                        AppText(
                          title: tr('order_number') + ": " + "123456",
                          color: AppColors.blackOlive,
                          maxLines: 1,
                          appTextStyle: AppTextStyle.body,
                        ),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 30.height,
                      margin: EdgeInsets.symmetric(horizontal: 10.width),
                      color: AppColors.primary,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(Res.logout_time),
                        SizedBox(
                          width: 6.width,
                        ),
                        Expanded(
                          child: AppText(
                            title: tr('to_time') + ": " + "12:30",
                            color: AppColors.blackOlive,
                            maxLines: 1,
                            appTextStyle: AppTextStyle.body,
                          ),
                        ),
                        AppText(
                          title: tr('request_type') + ": " + "123456",
                          color: AppColors.blackOlive,
                          maxLines: 1,
                          appTextStyle: AppTextStyle.body,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.height,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                title: tr('date') + ": " + "20/10/2021",
                color: AppColors.blackOlive,
                maxLines: 1,
                appTextStyle: AppTextStyle.body,
              ),
              _HistoryStatus(status: VacationStatus.rejected),
            ],
          )
        ],
      ),
    );
  }
}
