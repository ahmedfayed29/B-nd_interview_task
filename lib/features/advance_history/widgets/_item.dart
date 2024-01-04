part of '../view.dart';

class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.height, horizontal: 16.width),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageItem(
              title: tr('money'),
              value: '2222',
              image: Res.money,
              trailing: tr('order_number') + ": " + "123456"),
          Container(
            width: 1,
            height: 12.height,
            margin: EdgeInsets.symmetric(horizontal: 10.width),
            color: AppColors.primary,
          ),
          imageItem(
              title: tr('payments'),
              value: '3',
              image: Res.money_in,
              trailing: tr('advance_type') + ": " + "نقدية"),
          SizedBox(
            height: 12.height,
          ),
          imageItem(
              title: tr('first_payment'),
              value: '12/06/2023',
              image: Res.calender,
              trailing: tr('payed') + ": " + "123456"),
          SizedBox(
            height: 12.height,
          ),
          imageItem(
              title: tr('payment_amount'),
              value: '40',
              image: Res.money_in,
              trailing: tr('rest') + ": " + "123456"),
          SizedBox(
            height: 16.height,
          ),
          Row(
            children: [
              _HistoryStatus(status: AdvanceStatus.rejected),
            ],
          ),
        ],
      ),
    );
  }

  Widget imageItem(
          {required String title,
          required String value,
          required String image,
          required String trailing}) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SvgPicture.asset(
            image,
            width: 24.width,
            height: 24.height,
          ),
          SizedBox(
            width: 6.width,
          ),
          AppText(
            title: title + ": " + value,
            color: AppColors.blackOlive,
            maxLines: 1,
            appTextStyle: AppTextStyle.body,
          ),
          Spacer(),
          AppText(
            title: trailing,
            color: AppColors.blackOlive,
            maxLines: 1,
            appTextStyle: AppTextStyle.body,
          ),
        ],
      );
}
