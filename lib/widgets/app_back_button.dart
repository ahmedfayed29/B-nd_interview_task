import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';

import '../core/helpers/utils.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Utils.isAR ? Alignment.centerRight : Alignment.centerLeft,
      child: RotatedBox(
        quarterTurns: Utils.isAR ? 0 : 2,
        child: InkWell(
          onTap: () => RouteUtils.pop(),
          child: Icon(
            Utils.isAR
                ? FontAwesomeIcons.chevronRight
                : FontAwesomeIcons.chevronLeft,
            color: color ?? AppColors.black,
            size: 20.height,
          ),
        ),
      ),
    );
  }
}
