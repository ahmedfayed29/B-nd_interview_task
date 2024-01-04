part of '../view.dart';

class _Inputs extends StatelessWidget {
  const _Inputs({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = RequestAdvanceCubit.of(context);
    return Column(
      children: [
        AppTextField(
          onTap: () {},
          hint: tr('advance_type'),
          controller: cubit.advanceType,
          borderColor: AppColors.white,
          fillColor: AppColors.white,
          trailing: Icon(Icons.keyboard_arrow_down_sharp),
        ),
        SizedBox(
          height: 16.height,
        ),
        Row(
          children: [
            Expanded(
              child: AppTextField(
                hint: tr('advance_amount'),
                controller: cubit.advanceAmount,
                borderColor: AppColors.white,
                fillColor: AppColors.white,
              ),
            ),
            SizedBox(
              width: 12.width,
            ),
            Expanded(
              child: AppTextField(
                hint: tr('advance_payment_number'),
                controller: cubit.advancePaymentNumber,
                borderColor: AppColors.white,
                fillColor: AppColors.white,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.height,
        ),
        AppTextField(
          onTap: () {},
          trailing: SvgPicture.asset(
            Res.select_calender,
            width: 24.width,
            height: 24.height,
          ),
          hint: tr('advance_payment_first_date'),
          controller: cubit.date,
          borderColor: AppColors.white,
          fillColor: AppColors.white,
        ),
        SizedBox(
          height: 16.height,
        ),
        AppTextField(
          hint: tr('advance_payment_amount'),
          controller: cubit.advanceAmount,
          borderColor: AppColors.white,
          fillColor: AppColors.white,
        ),
        SizedBox(
          height: 16.height,
        ),
        AppTextField(
          hint: tr('add_notes'),
          controller: cubit.notes,
          borderColor: AppColors.white,
          fillColor: AppColors.white,
          maxLines: 4,
          inputType: TextInputType.multiline,
        ),
      ],
    );
  }
}
