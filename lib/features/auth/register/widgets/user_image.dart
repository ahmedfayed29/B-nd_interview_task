part of '../view.dart';

class _UserImage extends StatelessWidget {
  const _UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.of(context);
    return InkWell(
      onTap: () => cubit.getImage(),
      child: Container(
        width: 90.width,
        height: 90.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 83.width,
              height: 83.height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: cubit.image == null
                      ? Colors.transparent
                      : AppColors.primary,
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
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      Res.add,
                      width: 25.width,
                      height: 25.height,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
