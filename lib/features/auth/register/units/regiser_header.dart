part of '../view.dart';

class _RegisterHeader extends StatelessWidget {
  const _RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.of(context);
    return Column(
      children: [
        InkWell(
          onTap: () {
            cubit.changeCurrentStep(step: 1);
            RouteUtils.pop();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
              AppText(
                  title: tr('register'),
                  color: AppColors.black,
                  appTextStyle: AppTextStyle.displayXsBold),
            ],
          ),
        ),
        SizedBox(
          height: 32.height,
        ),
        _RegisterStepper(),
        SizedBox(
          height: 20.height,
        ),
      ],
    );
  }
}
