part of '../view.dart';

class _UserImage extends StatelessWidget {
  const _UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 16.height),
      width: 83.width,
      height: 83.height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: cubit.image == null ? Colors.transparent : AppColors.primary,
        ),
        image: DecorationImage(
          image: cubit.image == null
              ? AssetImage(
                  Res.user_image,
                )
              : FileImage(cubit.image!) as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
