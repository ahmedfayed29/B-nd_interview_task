import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';

Future<DateTime?> datePicker({
  required BuildContext context,
  required TextEditingController dateController,
  DateTime? firstDate,
  DateTime? initDate,
  DateTime? lastDate,
}) async {
  DateTime? newDateTime = await showRoundedDatePicker(
    context: context,
    initialDate: initDate ?? DateTime(1999),
    firstDate: firstDate ?? DateTime(1900),
    styleDatePicker: MaterialRoundedDatePickerStyle(
      backgroundActionBar: AppColors.white,
      backgroundHeader: AppColors.white,
      backgroundHeaderMonth: AppColors.white,
      backgroundPicker: AppColors.white,
      colorArrowNext: AppColors.primary,
      colorArrowPrevious: AppColors.primary,
    ),
    theme: Theme.of(context).copyWith(
      colorScheme: ColorScheme.light(
        primary: AppColors.primary, // header background color
        onPrimary: AppColors.black, // header text color
        onSurface: AppColors.black, // body text color
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary, // button text color
        ),
      ),
    ),
    textNegativeButton: tr('cancel'),
    lastDate: lastDate ?? DateTime.now().subtract(Duration(days: 1460)),
    borderRadius: 16,
  );
  if (newDateTime != null) {
    dateController.text = DateFormat("yyyy-MM-dd", "en").format(newDateTime);
  }
  return newDateTime;
}

Future<TimeOfDay?> timePicker({
  required BuildContext context,
  required TextEditingController timeController,
}) async {
  TimeOfDay? time = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (context, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(),
        ),
        child: child ?? SizedBox(),
      );
    },
  );

  if (time != null) {
    timeController.text = "${time.format(context)}";
  }
  return time;
}
