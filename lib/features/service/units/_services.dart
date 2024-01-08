part of '../view.dart';

class _Services extends StatelessWidget {
  const _Services({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = ServiceCubit.of(context);
    return SizedBox(
      height: 200.height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => _Item(),
        itemCount: 10,
        separatorBuilder: (_, index) => SizedBox(
          width: 8.width,
        ),
      ),
    );
  }
}
