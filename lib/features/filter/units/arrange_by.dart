part of '../view.dart';

class _ArrangeBy extends StatelessWidget {
  const _ArrangeBy({super.key});

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
          Row(
            children: [
              SvgPicture.asset(
                Res.calender,
                width: 24.width,
                height: 24.height,
              ),
              SizedBox(
                width: 6.width,
              ),
              AppText(
                title: tr('date'),
                color: AppColors.blackOlive,
                appTextStyle: AppTextStyle.body,
              ),
            ],
          ),
          SizedBox(
            height: 10.height,
          ),
          Row(
            children: [
              _RadioItem(
                title: tr('ascending'),
                value: 1,
                group: cubit.dateFilter,
                onTap: () => cubit.changeDateFilter(value: 1),
              ),
              _RadioItem(
                title: tr('descending'),
                value: 2,
                group: cubit.dateFilter,
                onTap: () => cubit.changeDateFilter(value: 2),
              ),
            ],
          ),
          SizedBox(
            height: 16.height,
          ),
          Row(
            children: [
              SvgPicture.asset(
                Res.select_time,
                width: 24.width,
                height: 24.height,
              ),
              SizedBox(
                width: 6.width,
              ),
              AppText(
                title: tr('time'),
                color: AppColors.blackOlive,
                appTextStyle: AppTextStyle.body,
              ),
            ],
          ),
          SizedBox(
            height: 10.height,
          ),
          Row(
            children: [
              _RadioItem(
                title: tr('attended'),
                value: 1,
                group: cubit.timeFilter,
                onTap: () => cubit.changeTimeFilter(value: 1),
              ),
              _RadioItem(
                title: tr('absent'),
                value: 2,
                group: cubit.timeFilter,
                onTap: () => cubit.changeTimeFilter(value: 2),
              ),
              _RadioItem(
                title: tr('vacancy'),
                value: 3,
                group: cubit.timeFilter,
                onTap: () => cubit.changeTimeFilter(value: 3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
