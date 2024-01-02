part of '../app_scaffold.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBack;
  final String backTitle;

  const _AppBar({super.key, this.showBack = false, this.backTitle = ''});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: Container(
        decoration: BoxDecoration(color: AppColors.primary),
        padding: EdgeInsets.only(
            top: Utils.topDevicePadding, left: 16.width, right: 16.width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _AppBarDrawer(backTitle: backTitle, showBack: showBack),
            SizedBox(
              height: 16.height,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _AppBarUser()),
                InkWell(
                  child: SvgPicture.asset(
                    Res.notifications,
                    width: 24.width,
                    height: 24.height,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      preferredSize: Size.fromHeight(140.height),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(140.height);
}
