part of '../view.dart';

class _LoginHeader extends StatelessWidget {
  const _LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SvgPicture.asset(
            Res.login_header,
            width: 225.width,
            height: 225.height,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 20.height,
        ),
      ],
    );
  }
}
