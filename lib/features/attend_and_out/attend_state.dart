part of 'attend_cubit.dart';

abstract class AttendState extends Equatable {
  final bool changed;
  const AttendState({required this.changed});
}

class AttendInitial extends AttendState {
  AttendInitial({required super.changed});

  @override
  List<Object> get props => [changed];
}
