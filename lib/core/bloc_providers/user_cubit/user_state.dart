part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  final UserModel? userModel;
  const UserState({this.userModel});
}

class UserInitial extends UserState {
  UserInitial({UserModel? userModel}) : super(userModel: userModel);

  @override
  List<Object> get props => [userModel!];
}

class UserUpdate extends UserState {
  UserUpdate({required UserModel userModel}) : super(userModel: userModel);

  @override
  List<Object> get props => [userModel!];
}
