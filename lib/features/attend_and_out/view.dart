import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/features/attend_and_out/attend_cubit.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_text.dart';

part 'units/_options.dart';
part 'units/finger_print.dart';
part 'units/time.dart';
part 'widgets/attend_item.dart';

class AttendAndOutView extends StatelessWidget {
  const AttendAndOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AttendCubit(),
      child: BlocBuilder<AttendCubit, AttendState>(
        builder: (context, state) {
          return ListView(
            padding:
                EdgeInsets.symmetric(horizontal: 16.width, vertical: 16.height),
            children: [
              _Options(),
              SizedBox(
                height: 32.height,
              ),
              _FingerPrint(),
              SizedBox(
                height: 24.height,
              ),
              _Time(),
            ],
          );
        },
      ),
    );
  }
}
