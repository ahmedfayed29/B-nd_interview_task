import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/widgets/app_scaffold/app_scaffold.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backTitle: tr('attend_history'),
      showBack: true,
      page: ListView(
        children: [

        ],
      ),
    );
  }
}
