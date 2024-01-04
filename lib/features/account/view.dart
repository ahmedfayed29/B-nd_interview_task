import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/features/account/account_cubit.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_scaffold/app_scaffold.dart';
import 'package:hr_app/widgets/app_scaffold/widgets/_app_bar_user.dart';
import 'package:hr_app/widgets/app_text.dart';

part 'units/_data_view.dart';
part 'units/_info_view.dart';
part 'units/header.dart';
part 'units/view_header.dart';
part 'widgets/_data_item.dart';
part 'widgets/_header_item.dart';
part 'widgets/_info_item.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(),
      child: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) {
          final cubit = AccountCubit.of(context);
          return AppScaffold(
            currentPage: 2,
            backTitle: tr('main_menu'),
            showBack: true,
            header: _Header(),
            page: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.width,
                vertical: 16.height,
              ),
              child: Column(
                children: [
                  _ViewHeader(),
                  Expanded(
                      child:
                          cubit.currentPage == 1 ? _InfoView() : _DataView()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
