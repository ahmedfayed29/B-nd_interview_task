part of '../view.dart';

class _NotificationsHeader extends StatelessWidget {
  const _NotificationsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = NotificationsCubit.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
            title: tr('notifications'),
            color: AppColors.primary,
            appTextStyle: AppTextStyle.subHeader),
        Switch(
            value: cubit.notificationSwitch,
            activeColor: AppColors.primary,
            onChanged: (val) => cubit.changeNotificationSwitch()),
      ],
    );
  }
}
