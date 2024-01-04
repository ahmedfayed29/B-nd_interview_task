part of '../view.dart';

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = AccountCubit.of(context);
    return Row(
      children: [
        _HeaderItem(
          selected: cubit.currentPage == 1,
          title: tr('main_info'),
          onTap: () => cubit.changePage(1),
        ),
        SizedBox(
          width: 16.width,
        ),
        _HeaderItem(
          selected: cubit.currentPage == 2,
          title: tr('regulatory_data'),
          onTap: () => cubit.changePage(2),
        ),
      ],
    );
  }
}
