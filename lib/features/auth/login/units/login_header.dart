part of '../view.dart';

class _LoginHeader extends StatelessWidget {
  const _LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AppText(
                title: tr('welcome'),
                color: AppColors.primary,
                textAlign: TextAlign.center,
                appTextStyle: AppTextStyle.header),
          ],
        ),
        SizedBox(
          height: 8.height,
        ),
        // Center(
        //   child: Image.asset(
        //     Res.logo,
        //     width: 184.width,
        //     height: 190.height,
        //     fit: BoxFit.fill,
        //   ),
        // ),
        SizedBox(
          height: 24.height,
        ),
        AppText(
            title: tr('login'),
            color: AppColors.primary,
            textAlign: TextAlign.center,
            appTextStyle: AppTextStyle.subHeader),
      ],
    );
  }
}
