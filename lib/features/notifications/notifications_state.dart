part of 'notifications_cubit.dart';

abstract class NotificationsState extends Equatable {
  final bool changed;
  const NotificationsState({required this.changed});
}

class NotificationsInitial extends NotificationsState {
  NotificationsInitial({required super.changed});

  @override
  List<Object> get props => [changed];
}
