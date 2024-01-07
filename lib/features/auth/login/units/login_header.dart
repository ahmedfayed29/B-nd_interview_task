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
                title: tr('account_login'),
                color: AppColors.primary,
                appTextStyle: AppTextStyle.displayXsBold),
          ],
        ),
        SizedBox(
          height: 32.height,
        ),
        Center(
          child: Image.asset(
            Res.login_header,
            width: 225.width,
            height: 225.height,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 20.height,
        ),
      ],
    );
  }
}
