import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit() : super(CountriesInitial(changed: false));

  static CountriesCubit of(context) => BlocProvider.of(context);

  final NumberPaginatorController pageController = NumberPaginatorController();
  int currentPage = 1;

  void changePage(int page) {
    currentPage = page;
    pageController.currentPage = page;
    emit(CountriesInitial(changed: !state.changed));
  }
}
