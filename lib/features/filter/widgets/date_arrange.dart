part of '../view.dart';

class _DateArrange extends StatelessWidget {
  const _DateArrange({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = FilterCubit.of(context);

    return Column(
      children: [
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
      ],
    );
  }
}
