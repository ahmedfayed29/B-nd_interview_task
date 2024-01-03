import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial(changed: false));
  static NotificationsCubit of(context) => BlocProvider.of(context);
  bool notificationSwitch = false;

  void changeNotificationSwitch() {
    notificationSwitch = !notificationSwitch;
    emit(NotificationsInitial(changed: !state.changed));
  }
}
