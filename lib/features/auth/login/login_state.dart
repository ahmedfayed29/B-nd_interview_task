part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  final bool changed;
  const LoginState({required this.changed});
}

class LoginInitial extends LoginState {
  LoginInitial({required super.changed});

  @override
  List<Object> get props => [changed];
}
