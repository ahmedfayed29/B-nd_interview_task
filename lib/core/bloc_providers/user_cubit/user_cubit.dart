import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/models/user/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void updateUser(UserModel model) {
    emit(UserUpdate(userModel: model));
  }

  void removeUser() {
    emit(UserInitial());
  }
}
