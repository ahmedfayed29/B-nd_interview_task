part of '../view.dart';

class _Employee extends StatelessWidget {
  const _Employee({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = FilterCubit.of(context);

    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              Res.employee,
              width: 24.width,
              height: 24.height,
            ),
            SizedBox(
              width: 6.width,
            ),
            AppText(
              title: tr('employee_status'),
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
            _CheckItem(
              title: tr('attended'),
              value: cubit.attended,
              onTap: () => cubit.changeAttendedStatus(),
            ),
            _CheckItem(
              title: tr('absent'),
              value: cubit.absent,
              onTap: () => cubit.changeAbsentStatus(),
            ),
            _CheckItem(
              title: tr('vacancy'),
              value: cubit.vacancy,
              onTap: () => cubit.changeVacancyStatus(),
            ),
          ],
        ),
      ],
    );
  }
}
