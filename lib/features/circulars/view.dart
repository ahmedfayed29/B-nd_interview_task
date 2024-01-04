import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/core/helpers/enums/filter_status.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';
import 'package:hr_app/features/filter/view.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_scaffold/app_scaffold.dart';
import 'package:hr_app/widgets/app_text.dart';

part 'units/header.dart';
part 'units/list.dart';
part 'widgets/_item.dart';

class Circulars extends StatelessWidget {
  const Circulars({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentPage: 1,
      backTitle: tr('circulars'),
      showBack: true,
      page: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 16.width, vertical: 16.height),
        child: Column(
          children: [
            _Header(),
            _List(),
          ],
        ),
      ),
    );
  }
}
