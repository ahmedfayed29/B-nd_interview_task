part of '../view.dart';

class _Inputs extends StatelessWidget {
  const _Inputs({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = RequestVacancyCubit.of(context);
    return Column(
      children: [
        AppTextField(
          onTap: () {},
          hint: tr('vacation_order_type'),
          controller: cubit.vacationType,
          borderColor: AppColors.white,
          fillColor: AppColors.white,
          trailing: Icon(Icons.keyboard_arrow_down_sharp),
        ),
        SizedBox(
          height: 16.height,
        ),
        AppTextField(
          hint: tr('vacation_days_count'),
          controller: cubit.vacationDaysCount,
          borderColor: AppColors.white,
          fillColor: AppColors.white,
          inputType: TextInputType.number,
        ),
        SizedBox(
          height: 16.height,
        ),
        Row(
          children: [
            Expanded(
              child: AppTextField(
                onTap: () {},
                controller: cubit.fromDate,
                hint: tr('from_date'),
                borderColor: AppColors.white,
                fillColor: AppColors.white,
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
                fillColor: AppColors.white,
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
        AppTextField(
          onTap: () {},
          hint: tr('replacement_employee'),
          controller: cubit.replacementEmployee,
          borderColor: AppColors.white,
          fillColor: AppColors.white,
          trailing: Icon(Icons.keyboard_arrow_down_sharp),
        ),
      ],
    );
  }
}
