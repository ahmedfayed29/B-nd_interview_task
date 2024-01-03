import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/features/notifications/notifications_cubit.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_scaffold/app_scaffold.dart';
import 'package:hr_app/widgets/app_text.dart';

part 'units/notification_header.dart';
part 'units/notifications_list.dart';
part 'widgets/_item.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backTitle: tr('notifications'),
      showBack: true,
      showNotifications: true,
      page: BlocProvider(
        create: (context) => NotificationsCubit(),
        child: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            final cubit = NotificationsCubit.of(context);
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.width, vertical: 16.height),
              child: Column(
                children: [
                  _NotificationsHeader(),
                  _NotificationsList(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
