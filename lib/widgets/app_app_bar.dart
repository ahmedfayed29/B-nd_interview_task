import 'package:flutter/material.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_back_button.dart';
import 'package:hr_app/widgets/app_text.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    Key? key,
    this.title,
    this.actions,
    this.hMargin = 16,
    this.canBack = true,
    this.centerTitle = true,
  }) : super(key: key);

  final double hMargin;
  final String? title;
  final bool canBack, centerTitle;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hMargin),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(),
        automaticallyImplyLeading: false,
        leading: Navigator.canPop(context)
            ? canBack
                ? AppBackButton()
                : null
            : null,
        centerTitle: centerTitle,
        titleSpacing:
            title == null || title!.isEmpty || !Navigator.canPop(context)
                ? null
                : -16,
        title: AppText(
          title: title ?? '',
          color: AppColors.black,
          appTextStyle: AppTextStyle.header,
        ),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
