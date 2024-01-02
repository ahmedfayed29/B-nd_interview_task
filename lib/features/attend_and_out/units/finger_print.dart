part of '../view.dart';

class _FingerPrint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.width,
      height: 200.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        Res.finger_print,
        width: 170.width,
        height: 170.height,
      ),
    );
  }
}
