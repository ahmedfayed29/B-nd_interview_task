import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/features/countries/countries_cubit.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_loading_indicator.dart';
import 'package:hr_app/widgets/app_text.dart';
import 'package:number_paginator/number_paginator.dart';

part 'units/_table.dart';
part 'units/_table_actions.dart';
part 'widgets/_table_header.dart';
part 'widgets/_table_item.dart';

class CountriesView extends StatelessWidget {
  const CountriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesCubit()..getCountries(),
      child: BlocBuilder<CountriesCubit, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoading) {
            return Center(
              child: AppLoadingIndicator(),
            );
          }
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 16.width, vertical: 16.height),
            child: Column(
              children: [
                _Table(),
                SizedBox(
                  height: 24.height,
                ),
                _TableActions(),
              ],
            ),
          );
        },
      ),
    );
  }
}
