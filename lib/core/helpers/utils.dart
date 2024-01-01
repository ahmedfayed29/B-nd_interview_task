import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/snack_bar.dart';
import '../route_utils/route_utils.dart';

const int pageSizeItems = 10;

class Utils {
  static Future<File?> pickImage({ImageSource? source}) async {
    final XFile? image =
        await ImagePicker().pickImage(source: source ?? ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    } else
      return null;
  }

  static Color getColor(String color) {
    final myColor = "0xff${color.replaceFirst("#", "")}";
    return Color(int.parse(myColor));
  }

  static Future<File?> getVideo() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      File imageFile = File(video.path);
      return imageFile;
    }
    return null;
  }

  static Future<List<File>> pickImages() async {
    final List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images != null) {
      final List<File> selectedImages = [];
      for (int i = 0; i < images.length; i++) {
        selectedImages.add(File(images[i].path));
      }
      return selectedImages;
    } else
      return [];
  }

  static String getAssetPNGPath(String image) {
    return 'assets/images/png/$image.png';
  }

  static String getAssetSVGPath(String image) {
    return 'assets/images/svg/$image.svg';
  }

  static double get bottomDevicePadding {
    final bottom = MediaQuery.of(RouteUtils.context).padding.bottom;
    if (bottom < 34) {
      return 34.height;
    }
    return bottom;
  }

  static double get topDevicePadding {
    final top = MediaQuery.of(RouteUtils.context).padding.top;
    if (top < 44) {
      return 44.height;
    }
    return top;
  }

  static double get appBarHeight {
    return AppBar().preferredSize.height;
  }

  static double get keyboardHeight {
    final keyboardHeight = MediaQuery.of(RouteUtils.context).viewPadding.bottom;
    if (keyboardHeight == 0) {
      return keyboardHeight;
    }
    return keyboardHeight + 16.height;
  }

  static bool get isAR {
    return RouteUtils.context.locale.languageCode == 'ar';
  }

  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static String getFileNameFromURL(String url, String symbol) =>
      url.substring(url.lastIndexOf(symbol) + 1);

  static String formatDate(DateTime? value) {
    if (value == null) {
      return "";
    }
    return "${value.year}/${value.month.toString().padLeft(2, '0')}/${value.day.toString().padLeft(2, '0')}";
  }

  static ThemeData get datePickerTheme {
    return Theme.of(RouteUtils.context).copyWith(
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.white,
        onSurface: AppColors.primary,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 10,
        ),
        bodyLarge: TextStyle(
          color: AppColors.primary,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
        ),
      ),
    );
  }

  static String timeDateApi({required TimeOfDay time, required DateTime date}) {
    String _date = DateFormat("yyyy-MM-dd", "en").format(date);
    String _time =
        "${time.hourOfPeriod > 9 ? time.hourOfPeriod : "0${time.hourOfPeriod}"}:${time.minute > 9 ? time.minute : "0${time.minute}"}"
        " ${time.period.name.toUpperCase()}";
    return _date + " " + _time;
  }

  static String timeApi({
    required TimeOfDay time,
  }) {
    String _time =
        "${time.hourOfPeriod > 9 ? time.hourOfPeriod : "0${time.hourOfPeriod}"}:${time.minute > 9 ? time.minute : "0${time.minute}"}"
        " ${time.period.name.toUpperCase()}";
    return _time;
  }
}

void handleGenericException(dynamic e) {
  try {
    // FirebaseCrashlytics.instance.recordError(e, e.stackTrace, fatal: true);
    showSnackBar('Unexpected Error', errorMessage: true);
    final char = "-";
    final divider = char * 40;
    debugPrint('');
    debugPrint(divider + " Unexpected Error " + divider);
    debugPrint(e.toString());
    debugPrintStack(stackTrace: e.stackTrace);
    debugPrint(divider + divider + "-" * 22);
    debugPrint('');
  } catch (e) {
    handleGenericException(e);
  }
}
