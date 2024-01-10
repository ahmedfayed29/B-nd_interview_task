import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/bloc_providers/user_cubit/user_cubit.dart';
import 'package:hr_app/core/models/user/user_model.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    print("saveUser $saveUser");
    print("_sharedPreferences ${await _sharedPreferences.getBool(_saveLogin)}");

    print("isRemember $isRemember");
  }

  static Future<void> clearCache() async {
    await _sharedPreferences.remove(_cachingUserKey);
  }

  static bool get isLogged {
    return user != null;
  }

  static Future<bool> get isRemember async {
    print(
        "_saveLogin ${await _sharedPreferences.getBool(_saveLogin) ?? false}");
    return await _sharedPreferences.getBool(_saveLogin)!;
  }

  static String? get token {
    return user?.accessToken;
  }
}
