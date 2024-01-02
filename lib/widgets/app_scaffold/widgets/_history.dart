part of '../app_scaffold.dart';

class _History extends StatelessWidget {
  const _History();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => RouteUtils.navigateTo(History()),
      child: Card(
        margin: EdgeInsets.zero,
        shape: CircleBorder(),
        elevation: 10,
        color: AppColors.blizzardBlue,
        child: Container(
          width: 70.width,
          height: 70.height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: AppColors.blizzardBlue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Res.history,
                width: 24.width,
                height: 24.height,
              ),
              SizedBox(
                height: 4.height,
              ),
              AppText(
                  title: tr('history'),
                  color: AppColors.blackOlive,
                  appTextStyle: AppTextStyle.subBody)
            ],
          ),
        ),
      ),
    );
  }
}
