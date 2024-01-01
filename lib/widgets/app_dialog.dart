import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';

import '../core/helpers/utils.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.child,
    required this.dismissible,
  });

  final Widget child;
  final bool dismissible;

  static Future<dynamic> show({
    required Widget child,
    bool dismissible = true,
  }) {
    return showDialog(
      context: RouteUtils.context,
      useRootNavigator: true,
      barrierDismissible: dismissible,
      barrierColor: AppColors.primary.withOpacity(0.7),
      builder: (context) {
        return AppDialog(
          child: child,
          dismissible: dismissible,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: UnconstrainedBox(
        constrainedAxis: Axis.horizontal,
        child: Container(
          margin: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: Utils.keyboardHeight,
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              if (dismissible)
                Align(
                  alignment:
                      Utils.isAR ? Alignment.centerLeft : Alignment.centerRight,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      FontAwesomeIcons.xmark,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                ),
              SizedBox(height: 12.height),
              child,
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
