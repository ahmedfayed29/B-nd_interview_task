part of '../view.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Utils.topDevicePadding, left: 16.width, right: 16.width),
      child: Row(
        children: [
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: 8.width, vertical: 8.height),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
          ),
          SizedBox(width: 12.width),
          Expanded(
            child: Column(
              children: [
                AppText(
                  title: tr('good_morning'),
                  appTextStyle: AppTextStyle.header,
                  color: AppColors.black,
                ),
              ],
            ),
          ),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: 8.width, vertical: 8.height),
            // child: SvgPicture.asset(Res.notification,
            //     width: 24.width, height: 24.height),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
