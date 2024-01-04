part of '../view.dart';

class _VacationTypes extends StatelessWidget {
  const _VacationTypes({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = FilterCubit.of(context);

    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              Res.time,
              width: 24.width,
              height: 24.height,
            ),
            SizedBox(
              width: 6.width,
            ),
            AppText(
              title: tr('vacation_status'),
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
              title: tr('accepted'),
              value: cubit.accepted,
              onTap: () => cubit.changeAcceptedStatus(),
            ),
            _CheckItem(
              title: tr('rejected'),
              value: cubit.rejected,
              onTap: () => cubit.changeRejectedStatus(),
            ),
          ],
        ),
        Row(
          children: [
            _CheckItem(
              title: tr('back'),
              value: cubit.back,
              onTap: () => cubit.changeBackStatus(),
            ),
            _CheckItem(
              title: tr('pending'),
              value: cubit.pending,
              onTap: () => cubit.changePendingStatus(),
            ),
          ],
        ),
      ],
    );
  }
}
