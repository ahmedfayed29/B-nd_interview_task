part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  final bool changed;
  const RegisterState({required this.changed});
}

class RegisterInitial extends RegisterState {
  RegisterInitial({required super.changed});

  @override
  List<Object> get props => [changed];
}
