import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/core/helpers/dimensions.dart';
import 'package:hr_app/system_design/colors/app_colors.dart';
import 'package:hr_app/system_design/text_styles/app_text_style.dart';
import 'package:hr_app/widgets/app_text.dart';

// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CustomModal extends StatelessWidget {
  final Widget content;
  final String title;

  const CustomModal({required this.content, required this.title});

  @override
  Widget build(BuildContext context) {
    print("title is $title");
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: AppText(
            title: title,
            appTextStyle: AppTextStyle.textMdSemiBold,
            color: AppColors.primary,
          ),
          middle: AppText(
            title: title,
            color: AppColors.white,
            appTextStyle: AppTextStyle.textMdSemiBold,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.close,
              size: 25,
              color: AppColors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: AppColors.primary,
        ),
        child: SafeArea(
          bottom: false,
          child: content,
        ),
      ),
    );
  }
}

class DownBottomSheet {
  final List data;
  final Function(Object item) onTab;
  final BuildContext context;
  final String title;

  DownBottomSheet(
      {required this.data,
      required this.onTab,
      required this.context,
      required this.title});

  showModal() {
    showModalBottomSheet(
      // expand: false,
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => CustomModal(
        title: title,
        content: Container(
          height: 300.height,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: data.length,
            itemBuilder: (BuildContext con, int position) {
              return InkWell(
                onTap: () => onTab(data[position]),
                child: Container(
                  height: 50.height,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: AppColors.white.withOpacity(.5),
                              width: 1))),
                  child: AppText(
                    title: data[position].name,
                    color: AppColors.black,
                    appTextStyle: AppTextStyle.textMdSemiBold,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
