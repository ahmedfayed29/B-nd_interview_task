part of 'service_cubit.dart';

abstract class ServiceState extends Equatable {
  final bool changed;
  const ServiceState({required this.changed});
}

class ServiceInitial extends ServiceState {
  ServiceInitial({required super.changed});

  @override
  List<Object> get props => [changed];
}
