part of 'account_cubit.dart';

abstract class AccountState extends Equatable {
  final bool changed;
  const AccountState({required this.changed});
}

class AccountInitial extends AccountState {
  AccountInitial({required super.changed});

  @override
  List<Object> get props => [changed];
}
