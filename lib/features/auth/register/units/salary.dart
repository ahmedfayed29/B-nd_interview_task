part of '../view.dart';

class _Salary extends StatelessWidget {
  const _Salary({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
            title: tr('salary'),
            color: AppColors.gray500,
            appTextStyle: AppTextStyle.textMdSemiBold),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.textFieldBG.withOpacity(.03),
          ),
          padding:
              EdgeInsets.symmetric(horizontal: 16.width, vertical: 16.height),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onLongPressStart: (v) {
                  cubit.timer =
                      Timer.periodic(const Duration(milliseconds: 150), (t) {
                    cubit.decreaseSalary();
                  });
                },
                onLongPressCancel: () {
                  cubit.timer?.cancel();
                },
                onLongPressEnd: (v) {
                  cubit.timer?.cancel();
                },
                onTap: () => cubit.decreaseSalary(),
                child: Container(
                  width: 24.width,
                  height: 24.height,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.white),
                  child: SvgPicture.asset(
                    Res.min,
                  ),
                ),
              ),
              AppText(
                  title: tr('sar') + " ${cubit.salary}",
                  color: AppColors.gray800,
                  appTextStyle: AppTextStyle.textXlSemiBold),
              GestureDetector(
                onLongPressStart: (v) {
                  cubit.timer =
                      Timer.periodic(const Duration(milliseconds: 150), (t) {
                    cubit.increaseSalary();
                  });
                },
                onLongPressCancel: () {
                  cubit.timer?.cancel();
                },
                onLongPressEnd: (v) {
                  cubit.timer?.cancel();
                },
                onTap: () => cubit.increaseSalary(),
                child: Container(
                  width: 24.width,
                  height: 24.height,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.white),
                  child: SvgPicture.asset(
                    Res.plus,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
