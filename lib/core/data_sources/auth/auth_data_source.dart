import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hr_app/core/caching_utils/caching_utils.dart';
import 'package:hr_app/core/models/country.dart';
import 'package:hr_app/core/models/service_model.dart';
import 'package:hr_app/core/models/user/user_model.dart';
import 'package:hr_app/core/network_utils/network_utils.dart';

class AuthDataSource {
  static Future<bool> register({
    required String firstName,
    required String lastName,
    required String about,
    required String salary,
    required String gender,
    required String type,
    required String email,
    required String birthDate,
    required String password,
    required String confirmPassword,
    required List<String> social,
    required List<int> tags,
    final File? image,
  }) async {
    final body = {
      "first_name": firstName,
      "last_name": lastName,
      "about": about,
      "tags[]": tags,
      "salary": salary,
      "password": password,
      "email": email,
      "birth_date": birthDate,
      "gender": gender,
      "type": type,
      "password_confirmation": confirmPassword,
    };
    for (int i = 0; i < social.length - 1; i++) {
      body["favorite_social_media[$i]"] =
          social[i] == "linkedin" ? "instagram" : social[i];
    }

    if (image != null) {
      body["avatar"] = await MultipartFile.fromFile(image.path);
    }
    print("body is $body");
    final res = await NetworkUtils.post(
      'user/register',
      formData: FormData.fromMap(body),
    );
    print("res isss $res");
    if (res.statusCode == 200) {
      print("res is ${res.data}");
      return true;
    } else
      return false;
  }

  static Future<bool> login(
      {required String email,
      required String password,
      required bool remember}) async {
    final body = {
      "password": password,
      "email": email,
    };

    print("body is $body");
    final res = await NetworkUtils.post(
      'user/login',
      formData: FormData.fromMap(body),
    );
    if (res.statusCode == 200) {
      print("res is ${res.data}");
      if (remember)
        CachingUtils.cacheUser(res.data);
      else
        CachingUtils.saveUser(user: UserModel.fromJson(res.data));
      return true;
    } else
      return false;
  }

  static Future<UserModel?> getProfile() async {
    final res = await NetworkUtils.get("user/who-am-i",
        headers: {'Authorization': "Bearer " + (CachingUtils.token ?? '')});
    if (res.statusCode == 200) {
      print("res is ${res.data}");
      CachingUtils.cacheUser(res.data);
      return UserModel.fromJson(res.data);
    } else
      return null;
  }

  static Future<CountryModel?> getCountries({required int page}) async {
    final res = await NetworkUtils.get("country?page=$page");
    if (res.statusCode == 200) {
      print("res is ${res.data}");
      return CountryModel.fromJson(res.data);
    } else
      return null;
  }

  static Future<List<ServiceModel>> getServices() async {
    final res = await NetworkUtils.get("service");
    if (res.statusCode == 200) {
      print("res is ${res.data}");
      return List<ServiceModel>.from(
          res.data['data'].map((x) => ServiceModel.fromJson(x)));
    } else
      return [];
  }

  static Future<List<ServiceModel>> getPopularServices() async {
    final res = await NetworkUtils.get("service/popular");
    if (res.statusCode == 200) {
      print("res is ${res.data}");
      return List<ServiceModel>.from(
          res.data['data'].map((x) => ServiceModel.fromJson(x)));
    } else
      return [];
  }
}
