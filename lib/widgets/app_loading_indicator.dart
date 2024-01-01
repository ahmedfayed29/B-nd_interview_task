import 'package:flutter/material.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 1.5,
        color: AppColors.primary,
      ),
    );
  }
}
