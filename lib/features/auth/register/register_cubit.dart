import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/helpers/utils.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial(changed: false));

  static RegisterCubit of(context) => BlocProvider.of(context);

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool facebook = false, twitter = false, linkedIn = false;
  bool viewPassword = false;
  bool viewConfirmPassword = false;
  int salary = 100;
  int gender = 0;
  int userType = 1;
  File? image;

  void changeGender({required int value}) {
    gender = value;
    emit(RegisterInitial(changed: !state.changed));
  }

  void changeUserType({required int value}) {
    userType = value;
    emit(RegisterInitial(changed: !state.changed));
  }

  void changeFacebook() {
    facebook = !facebook;
    emit(RegisterInitial(changed: !state.changed));
  }

  void changeTwitter() {
    twitter = !twitter;
    emit(RegisterInitial(changed: !state.changed));
  }

  void changeLinkedIn() {
    linkedIn = !linkedIn;
    emit(RegisterInitial(changed: !state.changed));
  }

  void changeViewPassword() {
    viewPassword = !viewPassword;
    emit(RegisterInitial(changed: !state.changed));
  }

  void changeViewConfirmPassword() {
    viewConfirmPassword = !viewConfirmPassword;
    emit(RegisterInitial(changed: !state.changed));
  }

  void increaseSalary() {
    if (salary < 1000) salary = salary + 10;
    emit(RegisterInitial(changed: !state.changed));
  }

  void decreaseSalary() {
    if (salary > 100) {
      salary = salary - 10;
      emit(RegisterInitial(changed: !state.changed));
    }
  }

  Future<void> getImage() async {
    final newImage = await Utils.pickImage();
    if (newImage != null) {
      image = newImage;
      emit(RegisterInitial(changed: !state.changed));
    }
  }
}
