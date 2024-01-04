part of '../view.dart';

class _InfoView extends StatelessWidget {
  const _InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _InfoItem(
          title: tr('user_name'),
          image: Res.user,
          value: 'ahmed fayed',
        ),
        _InfoItem(
          title: tr('password'),
          image: Res.lock,
          value: '********',
        ),
        _InfoItem(
          title: tr('email'),
          image: Res.mail,
          value: 'iva838@outlook.com',
        ),
        _InfoItem(
          title: tr('birthday'),
          image: Res.birthday,
          value: '12/12/2022',
        ),
        _InfoItem(
          title: tr('address'),
          image: Res.address,
          value: '11 - شارع الميدان - الرياض',
        ),
        _InfoItem(
          title: tr('gender'),
          image: Res.gender,
          value: tr('male'),
        ),
        _InfoItem(
          title: tr('marriage_status'),
          image: Res.heart,
          value: 'متزوج',
        ),
      ],
    );
  }
}
