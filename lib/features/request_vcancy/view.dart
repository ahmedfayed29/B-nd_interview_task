import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';
import 'package:hr_app/features/request_vcancy/request_vacancy_cubit.dart';
import 'package:hr_app/features/vacation_history/view.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/widgets/app_button.dart';
import 'package:hr_app/widgets/app_scaffold/app_scaffold.dart';
import 'package:hr_app/widgets/app_text_field.dart';
import 'package:hr_app/widgets/history_item.dart';

part 'units/_inputs.dart';

class RequestVacancyView extends StatelessWidget {
  const RequestVacancyView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backTitle: tr('request_vacation'),
      showBack: true,
      currentPage: 0,
      floatingActionButton:
          HistoryWidget(onTap: () => RouteUtils.navigateTo(VacationHistory())),
      page: BlocProvider(
        create: (context) => RequestVacancyCubit(),
        child: BlocBuilder<RequestVacancyCubit, RequestVacancyState>(
          builder: (context, state) {
            final cubit = RequestVacancyCubit.of(context);
            return ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.width, vertical: 16.height),
              children: [
                _Inputs(),
                AppButton(
                  title: tr('send_order'),
                  margin: EdgeInsets.only(top: 40.height),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
