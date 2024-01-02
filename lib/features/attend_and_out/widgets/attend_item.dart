part of '../view.dart';

class _AttendItem extends StatelessWidget {
  final String title, image, time;
  final Color iconColor;
  final bool selected;
  final VoidCallback onTap;

  const _AttendItem(
      {super.key,
      required this.title,
      required this.image,
      required this.time,
      required this.iconColor,
      required this.selected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * .28,
        height: 130.height,
        padding:
            EdgeInsets.symmetric(horizontal: 16.width, vertical: 16.height),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: selected ? AppColors.platinum : AppColors.white,
                width: 2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40.width,
              height: 40.height,
              alignment: Alignment.center,
              child: Center(
                child: SvgPicture.asset(
                  image,
                  fit: BoxFit.cover,
                  width: 24.width,
                  height: 24.height,
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconColor,
              ),
            ),
            SizedBox(
              height: 8.height,
            ),
            AppText(
              title: title,
              color: AppColors.blackOlive,
              textAlign: TextAlign.center,
              maxLines: 2,
              appTextStyle: AppTextStyle.subBody,
            ),
            AppText(
              title: time,
              textAlign: TextAlign.center,
              color: AppColors.blackOlive,
              appTextStyle: AppTextStyle.subBody,
            ),
          ],
        ),
      ),
    );
  }
}
