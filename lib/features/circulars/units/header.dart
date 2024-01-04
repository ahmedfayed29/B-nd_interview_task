part of '../view.dart';

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
            title: tr('circulars'),
            color: AppColors.primary,
            appTextStyle: AppTextStyle.subHeader),
        InkWell(
          onTap: () => RouteUtils.navigateTo(
            FilterView(
              filterStatus: FilterStatus.circulars,
            ),
          ),
          child: Container(
            width: 40.width,
            height: 40.height,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColors.blizzardBlue),
            padding:
                EdgeInsets.symmetric(horizontal: 8.width, vertical: 8.height),
            child: SvgPicture.asset(
              Res.filter,
            ),
          ),
        ),
      ],
    );
  }
}
