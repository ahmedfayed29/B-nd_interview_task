import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/data_sources/auth/auth_data_source.dart';
import 'package:hr_app/core/models/country.dart';
import 'package:number_paginator/number_paginator.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit() : super(CountriesLoading(changed: false));

  static CountriesCubit of(context) => BlocProvider.of(context);

  final NumberPaginatorController pageController = NumberPaginatorController();
  int currentPage = 0;
  int calling = 0;
  int lastPage = 0;
  final List<CountryDataModel> countries = [];

  Future<void> getCountries() async {
    countries.clear();
    final res = await AuthDataSource.getCountries(page: calling + 1);
    countries.addAll(res?.data ?? []);
    lastPage = res?.pagination.totalPages ?? 0;
    emit(CountriesInitial(changed: !state.changed));
  }

  Future<void> getMoreCountries() async {
    print("more isss ");
    countries.clear();
    final res = await AuthDataSource.getCountries(page: calling);
    countries.addAll(res?.data ?? []);
    lastPage = res?.pagination.totalPages ?? 0;
  }

  Future<void> changePage(int page) async {
    print("last is $lastPage");
    print("page is $page");
    emit(CountriesLoadingTable(changed: !state.changed));
    currentPage = page - 1;
    calling = page;
    await getMoreCountries();
    emit(CountriesInitial(changed: !state.changed));
    try {
      Future.delayed(Duration(seconds: 1), (() {
        pageController.currentPage = page;
        pageController.removeListener(() {});
      }));
    } catch (e, s) {
      print("e iss $e");
    }
  }
}
