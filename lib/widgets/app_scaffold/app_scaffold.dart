import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/core/helpers/utils.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_scaffold/cubit.dart';
import 'package:hr_app/widgets/app_scaffold/widgets/_app_bar_user.dart';
import 'package:hr_app/widgets/app_text.dart';

part 'units/_app_bar.dart';
part 'units/nav_bar.dart';
part 'widgets/_app_bar_drawer.dart';

class AppScaffold extends StatelessWidget {
  final bool showBack, showNotifications;
  final String backTitle;
  final Widget? page, floatingActionButton, header;
  final int? currentPage;

  const AppScaffold({
    super.key,
    this.showBack = false,
    this.showNotifications = false,
    this.backTitle = '',
    this.page,
    this.floatingActionButton,
    this.header,
    this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit()
        ..addContent()
        ..changePage(currentPage),
      child: BlocBuilder<NavBarCubit, NavBarStates>(
        builder: (context, state) {
          final cubit = NavBarCubit.of(context);
          return Scaffold(
            appBar: _AppBar(
              header: header,
              showNotifications: showNotifications,
              showBack:
                  page == null && cubit.currentPage == 1 ? true : showBack,
              backTitle: page == null && cubit.currentPage == 1
                  ? tr('attendance')
                  : backTitle,
            ),
            body: Container(
              decoration: BoxDecoration(
                  color: AppColors.white10,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  )),
              child: page ?? cubit.currentView,
            ),
            backgroundColor: AppColors.primary,
            bottomNavigationBar: _NavBar(forceNav: page != null),
          );
        },
      ),
    );
  }
}
