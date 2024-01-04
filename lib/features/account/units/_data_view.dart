part of '../view.dart';

class _DataView extends StatelessWidget {
  const _DataView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _DataItem(
          title: tr('branch'),
          image: Res.branch,
          value: 'فرع المعادي',
        ),
        _DataItem(
          title: tr('department'),
          image: Res.department,
          value: 'برمجيات',
        ),
        _DataItem(
          title: tr('job'),
          image: Res.job,
          value: 'مهندس برمجيات',
        ),
      ],
    );
  }
}
