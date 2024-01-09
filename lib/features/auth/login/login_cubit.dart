import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/data_sources/auth/auth_data_source.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';
import 'package:hr_app/features/nav_bar/view.dart';
import 'package:hr_app/widgets/app_loader_dialog.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial(changed: false));

  static LoginCubit of(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool rememberMe = false;
  bool viewPassword = false;

  void changeTerms() {
    rememberMe = !rememberMe;
    emit(LoginInitial(changed: !state.changed));
  }

  void changeViewPassword() {
    viewPassword = !viewPassword;
    emit(LoginInitial(changed: !state.changed));
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      showLoadingDialog(RouteUtils.context);
      try {
        final res = await AuthDataSource.login(
            remember: rememberMe, email: email.text, password: password.text);
        RouteUtils.pop();
        if (res) {
          RouteUtils.navigateAndPopAll(NavBarView());
        }
      } catch (e) {
        RouteUtils.pop();
      }
    }
  }
}
