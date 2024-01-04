part of '../view.dart';

class _FromToDate extends StatelessWidget {
  const _FromToDate({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = FilterCubit.of(context);

    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              Res.calender,
              width: 24.width,
              height: 24.height,
            ),
            SizedBox(
              width: 6.width,
            ),
            AppText(
              title: tr('date'),
              color: AppColors.blackOlive,
              appTextStyle: AppTextStyle.body,
            ),
          ],
        ),
        SizedBox(
          height: 10.height,
        ),
        Row(
          children: [
            Expanded(
              child: AppTextField(
                onTap: () {},
                controller: cubit.fromDate,
                hint: tr('from_date'),
                borderColor: AppColors.white,
                underlineBorder: true,
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Res.select_calender,
                      width: 24.width,
                      height: 24.height,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 12.width,
            ),
            Expanded(
              child: AppTextField(
                onTap: () {},
                controller: cubit.toDate,
                hint: tr('to_date'),
                borderColor: AppColors.white,
                underlineBorder: true,
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Res.select_calender,
                      width: 24.width,
                      height: 24.height,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.height,
        ),
      ],
    );
  }
}
