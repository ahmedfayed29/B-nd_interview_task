part of '../view.dart';

class _ArrangeBy extends StatelessWidget {
  final FilterStatus filterStatus;

  const _ArrangeBy({super.key, required this.filterStatus});

  @override
  Widget build(BuildContext context) {
    final cubit = FilterCubit.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 16.height),
      padding: EdgeInsets.symmetric(horizontal: 16.width, vertical: 16.height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: tr('range_by'),
            color: AppColors.primary,
            appTextStyle: AppTextStyle.subHeader,
          ),
          SizedBox(
            height: 8.height,
          ),
          Visibility(
              visible: filterStatus == FilterStatus.attendance ||
                  filterStatus == FilterStatus.vacation ||
                  filterStatus == FilterStatus.circulars,
              child: _DateArrange()),
          Visibility(
              visible: filterStatus == FilterStatus.advance,
              child: _MoneyAdvance()),
          Visibility(
              visible: filterStatus == FilterStatus.permission,
              child: _TimeArrange()),
          Visibility(
              visible: filterStatus == FilterStatus.attendance,
              child: _TimeAttendanceArrange()),
        ],
      ),
    );
  }
}
