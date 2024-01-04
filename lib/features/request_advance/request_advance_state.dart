part of 'request_advance_cubit.dart';

abstract class RequestAdvanceState extends Equatable {
  final bool changed;
  const RequestAdvanceState({required this.changed});
}

class RequestAdvanceInitial extends RequestAdvanceState {
  RequestAdvanceInitial({required super.changed});

  @override
  List<Object> get props => [changed];
}
