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
      child: Row(
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
                    AppText(
                      title: tr('resignation') + ": " + "12:02:06",
                      color: AppColors.blackOlive,
                      maxLines: 1,
                      appTextStyle: AppTextStyle.body,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                title: tr('date') + ": " + "12-08-2023",
                color: AppColors.blackOlive,
                maxLines: 1,
                appTextStyle: AppTextStyle.body,
              ),
              _HistoryStatus(status: AttendanceStatus.absent)
            ],
          ),
        ],
      ),
    );
  }
}
