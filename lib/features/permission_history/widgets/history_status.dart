part of '../view.dart';

class _HistoryStatus extends StatelessWidget {
  final VacationStatus status;
  const _HistoryStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.width, vertical: 4.height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: status.color,
      ),
      margin: EdgeInsets.only(top: 12.height),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            status.image,
            height: 24.height,
            width: 24.width,
          ),
          SizedBox(
            width: 6.width,
          ),
          AppText(
              title: tr(status.title),
              color: AppColors.white,
              appTextStyle: AppTextStyle.subHeader)
        ],
      ),
    );
  }
}
