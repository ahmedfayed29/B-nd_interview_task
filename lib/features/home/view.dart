import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_scaffold/cubit.dart';
import 'package:hr_app/widgets/app_text.dart';

part 'widgets/_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.width, vertical: 16.height),
      children: [
        _Item(
          title: tr('attend_and_out'),
          image: Res.attend_and_out,
          iconColor: AppColors.africanViolet,
          onTap: () => NavBarCubit.of(context).changePage(1),
        ),
        _Item(
          title: tr('request_vacation'),
          image: Res.time,
          iconColor: AppColors.richElectricBlue,
          onTap: () {},
        ),
        _Item(
          title: tr('request_advance'),
          image: Res.money,
          iconColor: AppColors.blueGray,
          onTap: () {},
        ),
        _Item(
          title: tr('asking_permission'),
          image: Res.escape,
          iconColor: AppColors.magenta,
          onTap: () {},
        ),
        _Item(
          title: tr('circulars'),
          image: Res.paper_pin,
          smallImage: true,
          iconColor: AppColors.blizzardBlue,
          onTap: () {},
        ),
      ],
    );
  }
}
