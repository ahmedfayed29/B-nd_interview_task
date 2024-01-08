import 'package:easy_localization/easy_localization.dart';

class Validator {
  static String? empty(String? value, {String? message}) {
    if (value == null || value.trim().isEmpty) {
      return message ?? tr("empty_field");
    }
    return null;
  }

  static String? carNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr("empty_field");
    } else if (value.length < 3) {
      return "car_number_length_validation".tr();
    }
    return null;
  }

  static String? idNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr("empty_field");
    } else if (value.length < 10) {
      return "write_id_number".tr();
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "insert your name";
    } else if (value.length < 2 || value.length > 50) {
      return 'insert correct name ';
    }
    return null;
  }

  static String? about(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "insert your info";
    } else if (value.trim().length < 10 || value.trim().length > 1000) {
      return 'insert correct info ';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr("write_password");
    } else if (value.length < 7) {
      return tr("password_must_be_at_least_8_char");
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr("write_email");
    } else if (!RegExp(r"""
^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""")
        .hasMatch(value)) {
      return tr("write_correct_email");
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr("write_phone");
    } else if (value.length < 9 || value.length > 11) {
      return tr("write_correct_phone");
    }
    return null;
  }

  static String? passwordConfirmation(
      {required String? password, required String? value}) {
    if (value == null || value.trim().isEmpty) {
      return tr("please_confirm_password");
    } else if (value != password) {
      return tr("password_dose_not_match");
    }
    return null;
  }
}
