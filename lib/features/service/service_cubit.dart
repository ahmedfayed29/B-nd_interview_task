import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitial(changed: false));

  static ServiceCubit of(context) => BlocProvider.of(context);

  final NumberPaginatorController pageController = NumberPaginatorController();
  int currentPage = 1;

  void changePage(int page) {
    currentPage = page;
    pageController.currentPage = page;
    emit(ServiceInitial(changed: !state.changed));
  }
}
