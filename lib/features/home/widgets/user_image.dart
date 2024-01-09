part of '../view.dart';

class _UserImage extends StatelessWidget {
  const _UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserCubit>().state.userModel!;
    final cubit = HomeCubit.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 16.height),
      child: AppNetworkImage(
        url: user.data.avatar,
        shape: BoxShape.circle,
        width: 83.width,
        height: 83.height,
        fit: BoxFit.cover,
        borderColor: AppColors.primary,
      ),
    );
  }
}
