import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial(changed: false));

  static FilterCubit of(context) => BlocProvider.of(context);
  final TextEditingController fromDate = TextEditingController();
  final TextEditingController toDate = TextEditingController();
  int dateFilter = 0;
  int timeFilter = 0;
  int employeeStatus = 0;
  bool absent = false;
  bool attended = false;
  bool vacancy = false;
  void changeDateFilter({required int value}) {
    dateFilter = value;
    emit(FilterInitial(changed: !state.changed));
  }

  void changeTimeFilter({required int value}) {
    timeFilter = value;
    emit(FilterInitial(changed: !state.changed));
  }

  void changeEmployeeFilter({required int value}) {
    employeeStatus = value;
    emit(FilterInitial(changed: !state.changed));
  }

  void changeAbsentStatus({required bool value}) {
    absent = value;
    emit(FilterInitial(changed: !state.changed));
  }

  void changeAttendedStatus({required bool value}) {
    attended = value;
    emit(FilterInitial(changed: !state.changed));
  }

  void changeVacancyStatus({required bool value}) {
    vacancy = value;
    emit(FilterInitial(changed: !state.changed));
  }
}
