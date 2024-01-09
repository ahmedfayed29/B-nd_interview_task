import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/bloc_providers/user_cubit/user_cubit.dart';
import 'package:hr_app/core/data_sources/auth/auth_data_source.dart';
import 'package:hr_app/core/models/dependencies_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading(changed: false));

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
  bool facebook = false, twitter = false, linkedIn = false;
  bool viewPassword = false;
  bool viewConfirmPassword = false;
  int gender = 0;
  int userType = 0;
  List<TagModel> skillsList = [];

  Future<void> initState({required BuildContext context}) async {
    await getProfile();
    setUser(context: context);
  }

  void setUser({required BuildContext context}) {
    final user = context.read<UserCubit>().state.userModel!;
    firstName.text = user.data.firstName;
    lastName.text = user.data.lastName;
    email.text = user.data.email;
    about.text = user.data.about;
    birthdate.text = DateFormat("yyyy-MM-dd", "en").format(user.data.birthDate);
    salary.text = user.data.salary.toString() + tr("sar");
    skillsList.addAll(user.data.tags);
    gender = user.data.gender;
    userType = user.data.type.code;
    print("vallll ${user.data.type.code}");
    user.data.favoriteSocialMedia.forEach((element) {
      if (element == "facebook") {
        facebook = true;
      } else if (element == "x") {
        twitter = true;
      } else if (element == "instagram") {
        linkedIn = true;
      }
    });
  }

  Future<void> getProfile() async {
    try {
      await AuthDataSource.getProfile();
    } catch (e) {}
    emit(HomeInitial(changed: !state.changed));
  }
}
