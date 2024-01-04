part of '../view.dart';

class _ViewBy extends StatelessWidget {
  final FilterStatus filterStatus;

  const _ViewBy({super.key, required this.filterStatus});

  @override
  Widget build(BuildContext context) {
    final cubit = FilterCubit.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.width, vertical: 16.height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: tr('view_by'),
            color: AppColors.primary,
            appTextStyle: AppTextStyle.subHeader,
          ),
          SizedBox(
            height: 8.height,
          ),
          _FromToDate(),
          SizedBox(
            height: 16.height,
          ),
          Visibility(
            visible: filterStatus == FilterStatus.attendance,
            child: _Employee(),
          ),
          Visibility(
            visible: filterStatus == FilterStatus.vacation,
            child: _VacationTypes(),
          ),
          Visibility(
            visible: filterStatus == FilterStatus.permission,
            child: _PermissionTypes(),
          ),
          Visibility(
            visible: filterStatus == FilterStatus.advance,
            child: _MoneyTypes(),
          ),
        ],
      ),
    );
  }
}
