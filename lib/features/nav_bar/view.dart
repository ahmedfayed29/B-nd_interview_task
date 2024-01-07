import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/core/helpers/utils.dart';
import 'package:hr_app/features/nav_bar/cubit.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_text.dart';

part 'units/nav_bar.dart';

class NavBarView extends StatelessWidget {
  final bool showBack, showNotifications;
  final String backTitle;
  final Widget? page, floatingActionButton, header;
  final int? currentPage;

  const NavBarView({
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
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.width),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppText(
                      title: cubit.currentTitle,
                      color: AppColors.black,
                      appTextStyle: AppTextStyle.displayXsBold,
                    ),
                  ],
                ),
              ),
            ),
            body: cubit.currentView,
            backgroundColor: AppColors.white,
            bottomNavigationBar: _NavBar(forceNav: page != null),
          );
        },
      ),
    );
  }
}
