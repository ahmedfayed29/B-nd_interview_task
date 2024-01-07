part of '../view.dart';

class _Item extends StatelessWidget {
  final String title, image;
  final VoidCallback onTap;
  final bool hasArrow;

  const _Item(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap,
      this.hasArrow = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 12.width, vertical: 12.height),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              width: 24.width,
              height: 24.height,
            ),
            SizedBox(width: 8.width),
            // AppText(
            //   title: title,
            //   color: AppColors.blackOlive,
            //   appTextStyle: AppTextStyle.body,
            // ),
            Spacer(),
            Visibility(
                visible: hasArrow,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                ))
          ],
        ),
      ),
    );
  }
}
