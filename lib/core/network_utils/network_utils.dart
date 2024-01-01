import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';

import '../caching_utils/caching_utils.dart';

class NetworkUtils {
  static final String _baseUrl = "http://207.38.87.126:2323/api/v1/";

  static late Dio _dio;
  static String get baseUrl => _baseUrl;

  static Future<void> init() async {
    _dio = Dio()..options.baseUrl = _baseUrl;
    _dio.options.validateStatus = (status) => true;
  }

  static Map<String, dynamic>? header = {
    "deviceType": Platform.isAndroid ? "Android" : "Ios",
    "Language": RouteUtils.context.locale.languageCode,
    // 'Authorization': "Bearer " + (CachingUtils.token ?? ''),
    'TokenId': (CachingUtils.token ?? ''),
  };

  static Future<Response<dynamic>> get(String path,
      {Map<String, dynamic>? headers}) async {
    if (header?['TokenId'] == '') {
      header?['TokenId'] = (CachingUtils.token ?? '');
    }
    _dio.options.headers = header;
    print("headers ${_dio.options.headers}");
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }

    final res = await _dio.get(path);
    handleErrors(res: res);
    return res;
  }

  static Future<Response<dynamic>> post(String path,
      {Map<String, dynamic>? data,
      var formData,
      Map<String, dynamic>? headers}) async {
    if (header?['TokenId'] == '') {
      header?['TokenId'] = (CachingUtils.token ?? '');
    }
    _dio.options.headers = header;
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }

    print("headers ${header}");
    print("data $data");
    final res = await _dio.post(path, data: formData ?? data);
    handleErrors(res: res);
    return res;
  }

  static Future<Response<dynamic>> patch(String path,
      {data, FormData? formData, Map<String, dynamic>? headers}) async {
    if (header?['TokenId'] == '') {
      header?['TokenId'] = (CachingUtils.token ?? '');
    }
    _dio.options.headers = header;

    print("headers ${_dio.options.headers}");
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }

    final res = await _dio.patch(path, data: formData ?? data);
    handleErrors(res: res);
    return res;
  }

  static Future<Response<dynamic>> delete(String path,
      {Map<String, dynamic>? data,
      FormData? formData,
      Map<String, dynamic>? headers}) async {
    if (header?['TokenId'] == '') {
      header?['TokenId'] = (CachingUtils.token ?? '');
    }
    _dio.options.headers = header;

    print("headers ${_dio.options.headers}");
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }

    final res = await _dio.delete(path, data: formData ?? data);
    handleErrors(res: res);
    return res;
  }

  static void handleErrors({required Response<dynamic> res}) {
    if (res.statusCode != 200) {
      final String error = res.data["errors"]
          .fold(
              '',
              (previousValue, element) =>
                  (previousValue as String) + " ," + element)
          .replaceFirst(',', '');
      if (res.data["errors"].isNotEmpty) Fluttertoast.showToast(msg: error);
    }
  }
}
