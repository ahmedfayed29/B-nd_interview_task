import 'package:flutter/material.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';

enum VacationStatus {
  rejected(
    color: AppColors.red,
    title: "rejected",
    value: "rejected",
    image: Res.absent,
  ),
  attended(
    color: AppColors.green,
    title: "accepted",
    value: "accepted",
    image: Res.attended,
  );

  const VacationStatus({
    required this.color,
    required this.title,
    required this.image,
    required this.value,
  });

  final Color color;
  final String title;
  final String image;
  final String value;
}
