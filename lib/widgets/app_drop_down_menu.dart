import 'package:flutter/material.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';

import '../core/helpers/utils.dart';

class AppDropDownMenu extends StatefulWidget {
  const AppDropDownMenu({
    Key? key,
    required this.hint,
    required this.onChange,
    required this.items,
    this.value,
    this.modeling = false,
  }) : super(key: key);

  final String hint;
  final dynamic value;
  final Function(dynamic) onChange;
  final List items;
  final bool modeling;

  @override
  State<AppDropDownMenu> createState() => _AppDropDownMenuState();
}

class _AppDropDownMenuState extends State<AppDropDownMenu> {
  dynamic value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Utils.isAR ? 10 : 20,
        right: Utils.isAR ? 20 : 10,
      ),
      child: DropdownButton(
        isExpanded: true,
        underline: SizedBox(),
        hint: Text(
          widget.hint,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        value: value,
        iconSize: 30,
        iconEnabledColor: AppColors.primary,
        iconDisabledColor: AppColors.primary,
        items: widget.items
            .map((e) => DropdownMenuItem(
                  child: Text(widget.modeling ? e.name : e.toString()),
                  value: e,
                ))
            .toList(),
        onChanged: (value) {
          this.value = value;
          setState(() {});
          widget.onChange(value);
          Utils.dismissKeyboard();
        },
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        border: Border.all(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
