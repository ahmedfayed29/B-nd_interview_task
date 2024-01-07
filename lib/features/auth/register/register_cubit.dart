import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/helpers/utils.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';
import 'package:hr_app/widgets/date_time_picker.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial(changed: false));

  static RegisterCubit of(context) => BlocProvider.of(context);

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController about = TextEditingController();
  final TextEditingController birthdate = TextEditingController();
  final TextEditingController skills = TextEditingController();
  int currentStep = 1;
  bool facebook = false, twitter = false, linkedIn = false;
  bool viewPassword = false;
  bool viewConfirmPassword = false;
  int salary = 100;
  int gender = 0;
  int userType = 1;
  File? image;
  Timer? timer;
  DateTime? date;

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

  Future<void> selectDate() async {
    final date = await datePicker(
        initDate: DateTime(1999),
        lastDate: DateTime.now().subtract(Duration(days: 1460)),
        context: RouteUtils.context,
        dateController: TextEditingController());
    if (date != null) {
      birthdate.text = DateFormat("yyyy-MM-dd", "en").format(date);
      this.date = date;

      emit(RegisterInitial(changed: !state.changed));
    }
  }

  void changeCurrentStep({required int step}) {
    currentStep = step;
    emit(RegisterInitial(changed: !state.changed));
  }
}
