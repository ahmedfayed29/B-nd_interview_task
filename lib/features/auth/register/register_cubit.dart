import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hr_app/core/data_sources/auth/auth_data_source.dart';
import 'package:hr_app/core/helpers/utils.dart';
import 'package:hr_app/core/models/dependencies_model.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';
import 'package:hr_app/features/auth/login/view.dart';
import 'package:hr_app/widgets/app_loader_dialog.dart';
import 'package:hr_app/widgets/date_time_picker.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial(changed: false));

  static RegisterCubit of(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
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
  int userType = 0;
  File? image;
  Timer? timer;
  DateTime? date;
  List<TagModel> skillsList = [];

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

  Future<void> register() async {
    if (formKey2.currentState!.validate()) {
      if (image == null) {
        Fluttertoast.showToast(msg: tr('insert_profile_avatar'));
        return;
      }
      final List<String> socialList = [];
      final List<int> tags = [];
      if (facebook) socialList.add("facebook");
      if (twitter) socialList.add("x");
      if (linkedIn) socialList.add("linkedIn");
      skillsList.forEach((element) {
        tags.add(element.value);
      });
      showLoadingDialog(RouteUtils.context);
      try {
        final res = await AuthDataSource.register(
            firstName: firstName.text,
            lastName: lastName.text,
            about: about.text,
            salary: salary.toString(),
            gender: gender.toString(),
            type: userType.toString(),
            email: email.text,
            birthDate: birthdate.text,
            password: password.text,
            confirmPassword: confirmPassword.text,
            social: socialList,
            image: image,
            tags: tags);
        RouteUtils.pop();
        if (res) {
          RouteUtils.navigateAndPopAll(LoginView());
        }
      } catch (e) {
        RouteUtils.pop();
      }
    }
  }

  void addTag(TagModel tagModel) {
    if (!skillsList.contains(tagModel)) skillsList.add(tagModel);
    RouteUtils.pop();
    emit(RegisterInitial(changed: !state.changed));
  }

  void removeTag(int index) {
    skillsList.removeAt(index);
    emit(RegisterInitial(changed: !state.changed));
  }
}
