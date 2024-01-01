part of '../view.dart';

class _NavBar extends StatelessWidget {
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
              onTap: () => cubit.changePage(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    e[0],
                    width: 24.width,
                    height: 24.height,
                  ),
                  SizedBox(height: 4.height),
                  AppText(
                    title: (e[1] as String),
                    appTextStyle:
                        isSelected ? AppTextStyle.header : AppTextStyle.header,
                    color: AppColors.primary,
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
