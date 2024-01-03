part of '../app_scaffold.dart';

class _AppBarDrawer extends StatelessWidget {
  final bool showBack;
  final String backTitle;

  const _AppBarDrawer({super.key, this.showBack = false, this.backTitle = ''});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: SvgPicture.asset(
            Res.drawer,
            width: 24.width,
            height: 24.height,
          ),
        ),
        Spacer(),
        Visibility(
          visible: showBack,
          child: AppText(
              title: backTitle,
              color: AppColors.white,
              appTextStyle: AppTextStyle.subBody),
        ),
        Visibility(
          visible: showBack,
          child: SizedBox(
            width: 4.width,
          ),
        ),
        Visibility(
          visible: showBack,
          child: InkWell(
            onTap: () {
              if (Navigator.canPop(context)) {
                RouteUtils.pop();
              } else {
                NavBarCubit.of(context).changePage(0);
              }
            },
            child: Transform(
              transform: Matrix4.rotationY(Utils.isAR ? pi : 0),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                Res.arrow_next,
                width: 24.width,
                height: 24.height,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
