import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/core/helpers/enums/attendance_status.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';
import 'package:hr_app/features/filter/view.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_scaffold/app_scaffold.dart';
import 'package:hr_app/widgets/app_text.dart';

part 'units/history_header.dart';
part 'units/history_list.dart';
part 'widgets/_item.dart';
part 'widgets/history_status.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentPage: 1,
      backTitle: tr('attend_history'),
      showBack: true,
      page: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 16.width, vertical: 16.height),
        child: Column(
          children: [
            _HistoryHeader(),
            _HistoryList(),
          ],
        ),
      ),
    );
  }
}
