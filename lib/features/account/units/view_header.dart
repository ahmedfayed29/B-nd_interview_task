part of '../view.dart';

class _ViewHeader extends StatelessWidget {
  const _ViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = AccountCubit.of(context);
    return Row(
      children: [
        Expanded(
            child: AppBarUser(
          companyColor: AppColors.primary.withOpacity(1),
          titleColor: AppColors.primary.withOpacity(.8),
          deviceColor: AppColors.primary.withOpacity(.6),
        )),
        Container(
          width: 40.width,
          height: 40.height,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            cubit.currentPage == 1 ? Res.edit : Res.print,
            width: 24.width,
            height: 24.height,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.blizzardBlue,
          ),
        )
      ],
    );
  }
}
