import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/data_sources/auth/auth_data_source.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';
import 'package:hr_app/features/nav_bar/view.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial(changed: false));

  static LoginCubit of(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool acceptTerms = false;
  bool viewPassword = false;

  void changeTerms() {
    acceptTerms = !acceptTerms;
    emit(LoginInitial(changed: !state.changed));
  }

  void changeViewPassword() {
    viewPassword = !viewPassword;
    emit(LoginInitial(changed: !state.changed));
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      final res = await AuthDataSource.login(
          email: email.text, password: password.text);
      if (res) {
        RouteUtils.navigateAndPopAll(NavBarView());
      }
    }
  }
}
