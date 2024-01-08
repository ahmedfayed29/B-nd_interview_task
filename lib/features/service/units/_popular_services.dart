part of '../view.dart';

class _PopularServices extends StatelessWidget {
  const _PopularServices({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = ServiceCubit.of(context);
    return SizedBox(
      height: 200.height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => _Item(service: cubit.services[index]),
        itemCount: cubit.services.length,
        separatorBuilder: (_, index) => SizedBox(
          width: 8.width,
        ),
      ),
    );
  }
}
