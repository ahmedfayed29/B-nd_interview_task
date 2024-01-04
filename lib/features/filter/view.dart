import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/core/helpers/enums/filter_status.dart';
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
part 'widgets/date_arrange.dart';
part 'widgets/employee.dart';
part 'widgets/from_to_date.dart';
part 'widgets/money_advance.dart';
part 'widgets/money_types.dart';
part 'widgets/permission_types.dart';
part 'widgets/radio_item.dart';
part 'widgets/time_arrange.dart';
part 'widgets/time_attendance_arrange.dart';
part 'widgets/vacation_types.dart';

class FilterView extends StatelessWidget {
  final FilterStatus filterStatus;

  const FilterView({super.key, required this.filterStatus});

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
                _ArrangeBy(filterStatus: filterStatus),
                _ViewBy(filterStatus: filterStatus),
                Visibility(
                  visible: filterStatus == FilterStatus.vacation,
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.height),
                    child: AppTextField(
                      onTap: () {},
                      hint: tr('vacation_order_type'),
                      controller: cubit.vacationType,
                      borderColor: AppColors.white,
                      fillColor: AppColors.white,
                      trailing: Icon(Icons.keyboard_arrow_down_sharp),
                    ),
                  ),
                ),
                Visibility(
                  visible: filterStatus == FilterStatus.permission,
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.height),
                    child: AppTextField(
                      onTap: () {},
                      hint: tr('permission_type'),
                      controller: cubit.permissionType,
                      borderColor: AppColors.white,
                      fillColor: AppColors.white,
                      trailing: Icon(Icons.keyboard_arrow_down_sharp),
                    ),
                  ),
                ),
                AppButton(
                    margin: EdgeInsets.only(top: 16.height),
                    title: tr('perform')),
              ],
            );
          },
        ),
      ),
    );
  }
}
