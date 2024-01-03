import 'package:flutter/material.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';

enum AttendanceStatus {
  absent(
    color: AppColors.red,
    title: "absent",
    value: "absent",
    image: Res.absent,
  ),
  attended(
    color: AppColors.green,
    title: "attended",
    value: "attended",
    image: Res.attended,
  ),
  vacancy(
    color: AppColors.orange,
    title: "vacancy",
    value: "vacancy",
    image: Res.vacancy,
  );

  const AttendanceStatus({
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
