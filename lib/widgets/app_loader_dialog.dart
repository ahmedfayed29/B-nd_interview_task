import 'package:flutter/material.dart';
import 'package:hr_app/widgets/app_loading_indicator.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AppLoadingIndicator();
      });
}
