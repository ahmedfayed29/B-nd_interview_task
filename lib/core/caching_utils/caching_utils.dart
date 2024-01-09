import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/bloc_providers/user_cubit/user_cubit.dart';
import 'package:hr_app/core/helpers/utils.dart';
import 'package:hr_app/core/models/user/user_model.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/snack_bar.dart';
import '../firebase_messaging_utils/firebase_messaging_utils.dart';
import '../network_utils/network_utils.dart';

class CachingUtils {
  static const String _cachingUserKey = 'logged_user';
  static const String _cachingIntro = 'intro_data';
  static const String _saveLogin = 'saveLogin';

  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void cacheIntro({required String intro}) {
    _sharedPreferences.setString(_cachingIntro, intro);
  }

  static UserModel? get user {
    print("sadasd ${_sharedPreferences.containsKey(_cachingUserKey)}");
    if (_sharedPreferences.containsKey(_cachingUserKey)) {
      return UserModel.fromJson(
          json.decode(_sharedPreferences.getString(_cachingUserKey)!));
    }
    return null;
  }

  static void saveUser({required UserModel user}) async {
    RouteUtils.context.read<UserCubit>().updateUser(user);
  }

  static Future<void> cacheUser(Map<String, dynamic> value,
      {bool updateToken = true, bool saveUser = false}) async {
    late UserModel user;
    if (updateToken) {
      user = UserModel.fromJson(value);
    } else {
      value["access_token"] =
          RouteUtils.context.read<UserCubit>().state.userModel!.accessToken;
      user = UserModel.fromJson(value);
    }
    RouteUtils.context.read<UserCubit>().updateUser(user);
    await _sharedPreferences.remove(_cachingUserKey);
    await _sharedPreferences.setString(
        _cachingUserKey, json.encode(user.toJson()));
    await _sharedPreferences.setBool(_saveLogin, saveUser);
  }

  static Future<void> clearCache() async {
    await _sharedPreferences.remove(_cachingUserKey);
  }

  static Future<void> signOut() async {
    try {
      final fcm = await FirebaseMessagingUtils.instance.getFCM();
      final response = await NetworkUtils.delete(
        'Logout',
        data: {"deviceId": fcm, "typeUser": "Driver"},
      );
      if (response.statusCode == 200) {
        await CachingUtils.clearCache();
        // RouteUtils.push(Routes.LOGIN, clean: true);
      } else {
        showSnackBar('something_went_wrong'.tr(), errorMessage: true);
      }
    } catch (e) {
      handleGenericException(e);
    }
  }

  static bool get isLogged {
    return user != null;
  }

  static String? get token {
    return user?.accessToken;
  }
}
