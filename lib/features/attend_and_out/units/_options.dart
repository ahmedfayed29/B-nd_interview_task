part of '../view.dart';

class _Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = AttendCubit.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _AttendItem(
          title: tr('attendance_registration'),
          image: Res.login_time,
          time: '12:02:06',
          iconColor: AppColors.platinum,
          selected: cubit.selected == 0,
          onTap: () => cubit.changeSelected(value: 0),
        ),
        _AttendItem(
          title: tr('dismissal_registration'),
          image: Res.logout_time,
          time: '12:02:06',
          iconColor: AppColors.blizzardBlue,
          selected: cubit.selected == 1,
          onTap: () => cubit.changeSelected(value: 1),
        ),
        _AttendItem(
          title: tr('working_times'),
          image: Res.working_hours,
          time: '12:02:06',
          iconColor: AppColors.azureishWhite,
          selected: cubit.selected == 2,
          onTap: () => cubit.changeSelected(value: 2),
        ),
      ],
    );
  }
}
