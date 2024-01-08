import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/data_sources/auth/auth_data_source.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial(changed: false));

  static HomeCubit of(context) => BlocProvider.of(context);
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController about = TextEditingController();
  final TextEditingController birthdate = TextEditingController();
  final TextEditingController skills = TextEditingController();
  final TextEditingController salary = TextEditingController();
  int currentStep = 1;
  bool facebook = true, twitter = true, linkedIn = false;
  bool viewPassword = false;
  bool viewConfirmPassword = false;
  int gender = 0;
  int userType = 1;
  File? image;

  Future<void> getProfile() async {
    final res = await AuthDataSource.getProfile();
    if (res != null) {
      firstName.text = res.data.firstName;
      lastName.text = res.data.lastName;
      email.text = res.data.email;
      about.text = res.data.about;
      birthdate.text = res.data.birthDate.toString();
      salary.text = res.data.salary.toString() + tr("sar");
      // skills.text=res.data.tags.toString();
    }
  }
}
