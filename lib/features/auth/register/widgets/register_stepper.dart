part of '../view.dart';

class _RegisterStepper extends StatelessWidget {
  const _RegisterStepper({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.of(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 1,
                color: Colors.transparent,
              ),
            ),
            AppText(
              title: "    " + tr('register'),
              color: cubit.currentStep >= 1
                  ? AppColors.primary
                  : AppColors.gray300,
              appTextStyle: AppTextStyle.textMdBold,
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 1,
                color: Colors.transparent,
              ),
            ),
            AppText(
              title: tr('complete_data'),
              color: cubit.currentStep >= 2
                  ? AppColors.primary
                  : AppColors.gray300,
              appTextStyle: AppTextStyle.textMdBold,
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 1,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12.height,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 1,
                color: AppColors.primary,
              ),
            ),
            Container(
              width: 25.width,
              height: 25.height,
              alignment: Alignment.center,
              child: AppText(
                title: '1',
                color: AppColors.white,
                appTextStyle: AppTextStyle.textMdBold,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 1,
                color: cubit.currentStep >= 2
                    ? AppColors.primary
                    : AppColors.gray200,
              ),
            ),
            Container(
              width: 25.width,
              height: 25.height,
              alignment: Alignment.center,
              child: AppText(
                title: cubit.currentStep >= 2 ? '2' : "",
                color: cubit.currentStep >= 2
                    ? AppColors.primary
                    : AppColors.white,
                appTextStyle: AppTextStyle.textMdBold,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cubit.currentStep >= 2
                      ? AppColors.white
                      : AppColors.gray200,
                  border: Border.all(
                    color: cubit.currentStep >= 2
                        ? AppColors.primary
                        : AppColors.gray200,
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 1,
                color: AppColors.gray200,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
