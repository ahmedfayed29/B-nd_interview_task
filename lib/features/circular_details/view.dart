import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_scaffold/app_scaffold.dart';
import 'package:hr_app/widgets/app_text.dart';

part 'units/header.dart';
part 'units/item.dart';

class CircularDetails extends StatelessWidget {
  const CircularDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentPage: 0,
      backTitle: tr('circulars'),
      showBack: true,
      page: ListView(
        padding:
            EdgeInsets.symmetric(horizontal: 16.width, vertical: 16.height),
        children: [
          _Header(),
          _Item(
              title: tr('employee_notes'),
              desc: 'لوريم ايبسوم هو نموذج افتراضي يوضع في '
                  'التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه'),
          _Item(
              title: tr('circular_notes'),
              desc: 'لوريم ايبسوم هو نموذج افتراضي يوضع في '
                  'التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه'),
        ],
      ),
    );
  }
}
