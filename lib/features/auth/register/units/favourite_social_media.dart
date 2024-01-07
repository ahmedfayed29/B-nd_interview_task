part of '../view.dart';

class _FavouriteMedia extends StatelessWidget {
  const _FavouriteMedia({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
            title: tr('favourite_social_media'),
            color: AppColors.gray500,
            appTextStyle: AppTextStyle.textMdSemiBold),
        Column(
          children: [
            checkBoxItem(
              title: tr('facebook'),
              value: cubit.facebook,
              image: Res.facebook,
              onTap: () => cubit.changeFacebook(),
            ),
            checkBoxItem(
              title: tr('twitter'),
              value: cubit.twitter,
              image: Res.twitter,
              onTap: () => cubit.changeTwitter(),
            ),
            checkBoxItem(
              title: tr('linkedIn'),
              value: cubit.linkedIn,
              image: '',
              onTap: () => cubit.changeLinkedIn(),
            ),
          ],
        )
      ],
    );
  }

  Widget checkBoxItem(
          {required String title,
          required String image,
          required bool value,
          required VoidCallback onTap}) =>
      Row(
        children: [
          Checkbox(
              value: value,
              activeColor: AppColors.primary,
              onChanged: (val) => onTap()),
          Visibility(
            visible: image != '',
            child: Image.asset(image, width: 24.width, height: 24.height),
            replacement: Container(
              width: 24.width,
              height: 24.height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff2867B2),
              ),
              padding:
                  EdgeInsets.symmetric(horizontal: 6.width, vertical: 6.height),
              child: Image.asset(
                Res.linkedin,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            width: 8.width,
          ),
          AppText(
              title: title,
              color: AppColors.black,
              appTextStyle: AppTextStyle.textLgSemiBold),
        ],
      );
}
