part of '../view.dart';

class _TimeAttendanceArrange extends StatelessWidget {
  const _TimeAttendanceArrange({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = FilterCubit.of(context);
    return Column(
      children: [
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
    );
  }
}
