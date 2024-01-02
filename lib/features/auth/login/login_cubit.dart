import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial(changed: false));

  static LoginCubit of(context) => BlocProvider.of(context);
  final TextEditingController url = TextEditingController();
  final TextEditingController companyNum = TextEditingController();
  final TextEditingController branchNum = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool acceptTerms = false;

  void changeTerms() {
    acceptTerms = !acceptTerms;
    emit(LoginInitial(changed: !state.changed));
  }
}
