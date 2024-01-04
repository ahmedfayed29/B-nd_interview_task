part of '../view.dart';

class _HistoryHeader extends StatelessWidget {
  const _HistoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
            title: tr('advance_history'),
            color: AppColors.primary,
            appTextStyle: AppTextStyle.subHeader),
        InkWell(
          onTap: () => RouteUtils.navigateTo(
            FilterView(
              filterStatus: FilterStatus.advance,
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
