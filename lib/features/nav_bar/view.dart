import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_text.dart';

import '../../core/helpers/utils.dart';
import 'cubit.dart';

part 'units/_app_bar.dart';
part 'units/nav_bar.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavBarCubit()..addContent(),
      child: BlocBuilder<NavBarCubit, NavBarStates>(
        builder: (context, state) {
          final cubit = NavBarCubit.of(context);
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: _AppBar(),
            body: cubit.currentView,
            bottomNavigationBar: _NavBar(),
          );
        },
      ),
    );
  }
}
