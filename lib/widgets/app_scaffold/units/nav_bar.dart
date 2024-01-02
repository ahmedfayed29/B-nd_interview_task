part of '../app_scaffold.dart';

class _NavBar extends StatelessWidget {
  final bool forceNav;

  const _NavBar({super.key, required this.forceNav});
  @override
  Widget build(BuildContext context) {
    final cubit = NavBarCubit.of(context);
    return Container(
      alignment: Alignment.center,
      height: 64.height + Utils.bottomDevicePadding,
      padding: EdgeInsets.only(
        bottom: Utils.bottomDevicePadding,
        top: 10.height,
      ),
      color: AppColors.white,
      child: Row(
        children: cubit.content.map((e) {
          final index = cubit.content.indexOf(e);
          final isSelected = index == cubit.currentPage;
          return Expanded(
            child: InkWell(
              onTap: () => cubit.changePage(index, forceNav: forceNav),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    isSelected ? e[0] : e[1],
                    width: 24.width,
                    height: 24.height,
                  ),
                  SizedBox(height: 4.height),
                  AppText(
                    title: (e[2] as String),
                    appTextStyle: isSelected
                        ? AppTextStyle.caption
                        : AppTextStyle.caption,
                    color: isSelected ? AppColors.primary : AppColors.gray,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
