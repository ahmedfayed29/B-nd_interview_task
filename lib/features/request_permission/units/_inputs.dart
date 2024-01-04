part of '../view.dart';

class _Inputs extends StatelessWidget {
  const _Inputs({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = RequestPermissionCubit.of(context);
    return Column(
      children: [
        AppTextField(
          onTap: () {},
          hint: tr('permission_type'),
          controller: cubit.permissionType,
          borderColor: AppColors.white,
          fillColor: AppColors.white,
          trailing: Icon(Icons.keyboard_arrow_down_sharp),
        ),
        SizedBox(
          height: 16.height,
        ),
        AppTextField(
          onTap: () {},
          hint: tr('date'),
          controller: cubit.date,
          borderColor: AppColors.white,
          fillColor: AppColors.white,
          trailing: SvgPicture.asset(Res.select_calender),
        ),
        SizedBox(
          height: 16.height,
        ),
        Row(
          children: [
            Expanded(
              child: AppTextField(
                onTap: () {},
                controller: cubit.fromTime,
                hint: tr('from_time'),
                borderColor: AppColors.white,
                fillColor: AppColors.white,
                underlineBorder: true,
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Res.time_input,
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
                controller: cubit.toTime,
                hint: tr('to_time'),
                borderColor: AppColors.white,
                fillColor: AppColors.white,
                underlineBorder: true,
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Res.time_input,
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
          hint: tr('permission_reason'),
          controller: cubit.reason,
          borderColor: AppColors.white,
          fillColor: AppColors.white,
          maxLines: 4,
          inputType: TextInputType.multiline,
        ),
      ],
    );
  }
}
