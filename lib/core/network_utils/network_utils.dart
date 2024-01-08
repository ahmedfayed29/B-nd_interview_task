import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../caching_utils/caching_utils.dart';

class NetworkUtils {
  static final String _baseUrl = "https://test.kafiil.com/api/test/";

  static late Dio _dio;

  static String get baseUrl => _baseUrl;

  static Future<void> init() async {
    _dio = Dio()..options.baseUrl = _baseUrl;
    _dio.options.validateStatus = (status) => true;
  }

  static Map<String, dynamic>? header = {
    "Accept-Language": Platform.isAndroid ? "Android" : "Ios",
    "Accept": "application/json",
    "Language": "en",
    // 'Authorization': "Bearer " + (CachingUtils.token ?? ''),
  };

  static Future<Response<dynamic>> get(String path,
      {Map<String, dynamic>? headers}) async {
    _dio.options.headers.clear();

    _dio.options.headers = header;
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }
    print("headers ${_dio.options.headers}");

    final res = await _dio.get(path);
    handleErrors(res: res);
    return res;
  }

  static Future<Response<dynamic>> post(String path,
      {Map<String, dynamic>? data,
      var formData,
      Map<String, dynamic>? headers}) async {
    _dio.options.headers.clear();
    print("path is $path");

    print("asdasd ${(!path.contains("login") && !path.contains("register"))}");
    print("headers ${header}");
    _dio.options.headers = header;
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }

    print("data $data");
    final res = await _dio.post(path, data: formData ?? data);
    handleErrors(res: res);
    return res;
  }

  static Future<Response<dynamic>> patch(String path,
      {data, FormData? formData, Map<String, dynamic>? headers}) async {
    if (header?['Authorization'] == null &&
        (!path.contains("login") || !path.contains("register"))) {
      header?['Authorization'] = "Bearer " + (CachingUtils.token ?? '');
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
    if (header?['Authorization'] == null &&
        (!path.contains("login") || !path.contains("register"))) {
      header?['Authorization'] = "Bearer " + (CachingUtils.token ?? '');
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
      print("res isss ${res.data}");
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
