part of '../view.dart';

class _ViewBy extends StatelessWidget {
  const _ViewBy({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = FilterCubit.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 16.height),
      padding: EdgeInsets.symmetric(horizontal: 16.width, vertical: 16.height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: tr('view_by'),
            color: AppColors.primary,
            appTextStyle: AppTextStyle.subHeader,
          ),
          SizedBox(
            height: 8.height,
          ),
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
          Row(
            children: [
              SvgPicture.asset(
                Res.employee,
                width: 24.width,
                height: 24.height,
              ),
              SizedBox(
                width: 6.width,
              ),
              AppText(
                title: tr('employee_status'),
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
              _CheckItem(
                title: tr('attended'),
                value: cubit.attended,
                onTap: () => cubit.changeAttendedStatus(value: !cubit.attended),
              ),
              _CheckItem(
                title: tr('absent'),
                value: cubit.absent,
                onTap: () => cubit.changeAbsentStatus(value: !cubit.absent),
              ),
              _CheckItem(
                title: tr('vacancy'),
                value: cubit.vacancy,
                onTap: () => cubit.changeVacancyStatus(value: !cubit.vacancy),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
