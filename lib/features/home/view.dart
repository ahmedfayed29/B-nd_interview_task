import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/features/home/home_cubit.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_text.dart';
import 'package:hr_app/widgets/app_text_field.dart';

part 'units/favourite_social_media.dart';
part 'units/fields.dart';
part 'units/gender.dart';
part 'units/user_type.dart';
part 'widgets/_item.dart';
part 'widgets/user_image.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return ListView(
            padding:
                EdgeInsets.symmetric(horizontal: 16.width, vertical: 16.height),
            children: [
              _Fields(),
            ],
          );
        },
      ),
    );
  }
}
