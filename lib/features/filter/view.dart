import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/features/filter/filter_cubit.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_button.dart';
import 'package:hr_app/widgets/app_scaffold/app_scaffold.dart';
import 'package:hr_app/widgets/app_text.dart';
import 'package:hr_app/widgets/app_text_field.dart';

part 'units/arrange_by.dart';
part 'units/view_by.dart';
part 'widgets/check_item.dart';
part 'widgets/radio_item.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backTitle: tr('filter'),
      showBack: true,
      page: BlocProvider(
        create: (context) => FilterCubit(),
        child: BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            final cubit = FilterCubit.of(context);
            return ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.width, vertical: 16.height),
              children: [
                _ArrangeBy(),
                _ViewBy(),
                AppButton(title: tr('perform')),
              ],
            );
          },
        ),
      ),
    );
  }
}
