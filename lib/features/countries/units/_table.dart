part of '../view.dart';

class _Table extends StatelessWidget {
  const _Table({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = CountriesCubit.of(context);
    return Flexible(
      child: cubit.state is CountriesLoadingTable
          ? Center(
              child: AppLoadingIndicator(),
            )
          : Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 6.width, vertical: 14.height),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
              ),
              child: Column(
                children: [
                  _TableHeader(),
                  Expanded(
                      child: ListView.separated(
                          padding: EdgeInsets.only(top: 14.height),
                          itemBuilder: (_, index) => _TableItem(
                              title: cubit.countries[index].name,
                              value: cubit.countries[index].capital),
                          separatorBuilder: (_, index) => Padding(
                                padding: EdgeInsets.only(bottom: 14.height),
                                child: Divider(
                                  color: AppColors.gray100,
                                ),
                              ),
                          itemCount: cubit.countries.length))
                ],
              ),
            ),
    );
  }
}
