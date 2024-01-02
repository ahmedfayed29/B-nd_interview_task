part of '../view.dart';

class _Item extends StatelessWidget {
  final String title, image;
  final Color iconColor;
  final bool smallImage;
  final VoidCallback onTap;

  const _Item({
    super.key,
    required this.title,
    required this.image,
    required this.iconColor,
    this.smallImage = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 24.width, vertical: 16.height),
        margin: EdgeInsets.only(bottom: 16.height),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 56.width,
              height: 56.height,
              alignment: Alignment.center,
              child: Center(
                child: SvgPicture.asset(
                  image,
                  fit: BoxFit.cover,
                  width: (smallImage ? 24 : 32).width,
                  height: (smallImage ? 24 : 32).height,
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconColor.withOpacity(.5),
              ),
            ),
            SizedBox(
              width: 16.width,
            ),
            AppText(
                title: title,
                color: AppColors.primary,
                appTextStyle: AppTextStyle.header)
          ],
        ),
      ),
    );
  }
}
