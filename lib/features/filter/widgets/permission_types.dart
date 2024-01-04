part of '../view.dart';

class _PermissionTypes extends StatelessWidget {
  const _PermissionTypes({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = FilterCubit.of(context);

    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              Res.escape,
              width: 24.width,
              height: 24.height,
            ),
            SizedBox(
              width: 6.width,
            ),
            AppText(
              title: tr('permission_status'),
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
