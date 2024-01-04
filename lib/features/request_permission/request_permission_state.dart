part of 'request_permission_cubit.dart';

abstract class RequestPermissionState extends Equatable {
  final bool changed;
  const RequestPermissionState({required this.changed});
}

class RequestPermissionInitial extends RequestPermissionState {
  RequestPermissionInitial({required super.changed});

  @override
  List<Object> get props => [changed];
}
