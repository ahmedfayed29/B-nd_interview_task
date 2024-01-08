import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/features/service/service_cubit.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_network_image.dart';
import 'package:hr_app/widgets/app_text.dart';

part 'units/_popular_services.dart';
part 'units/_services.dart';
part 'widgets/_item.dart';

class ServiceView extends StatelessWidget {
  const ServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceCubit(),
      child: BlocBuilder<ServiceCubit, ServiceState>(
        builder: (context, state) {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 16.width, vertical: 16.height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.height,
                ),
                _Services(),
                SizedBox(
                  height: 40.height,
                ),
                AppText(
                  title: tr('popular_services'),
                  color: AppColors.black,
                  appTextStyle: AppTextStyle.displayXsBold,
                ),
                SizedBox(
                  height: 32.height,
                ),
                _PopularServices(),
              ],
            ),
          );
        },
      ),
    );
  }
}
