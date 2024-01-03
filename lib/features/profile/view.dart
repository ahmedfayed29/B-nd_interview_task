import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_text.dart';

part 'units/_item.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 16.width,
        vertical: 16.height,
      ),
      children: [
        _Item(
          title: tr('profile'),
          image: Res.profile_on,
          onTap: () {},
          hasArrow: true,
        ),
        SizedBox(
          height: 16.height,
        ),
        _Item(
          title: tr('change_phone_settings'),
          image: Res.settings,
          onTap: () {},
          hasArrow: false,
        ),
        SizedBox(
          height: 64.height,
        ),
        _Item(
          title: tr('logout'),
          image: Res.logout,
          onTap: () {},
          hasArrow: false,
        ),
      ],
    );
  }
}
