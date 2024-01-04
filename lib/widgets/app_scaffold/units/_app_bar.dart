part of '../app_scaffold.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBack, showNotifications;
  final String backTitle;
  final Widget? header;

  const _AppBar(
      {super.key,
      this.showBack = false,
      this.header,
      this.showNotifications = false,
      this.backTitle = ''});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: Container(
        decoration: BoxDecoration(color: AppColors.primary),
        padding: EdgeInsets.only(
            top: Utils.topDevicePadding + (header == null ? 0 : 20),
            left: 16.width,
            right: 16.width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _AppBarDrawer(backTitle: backTitle, showBack: showBack),
            SizedBox(
              height: 16.height,
            ),
            header ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: AppBarUser()),
                    InkWell(
                      onTap: showNotifications
                          ? () {}
                          : () => RouteUtils.navigateTo(NotificationsView()),
                      child: SvgPicture.asset(
                        showNotifications
                            ? Res.notifications_on
                            : Res.notifications,
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
  Size get preferredSize =>
      Size.fromHeight((header == null ? 140 : 100).height);
}
