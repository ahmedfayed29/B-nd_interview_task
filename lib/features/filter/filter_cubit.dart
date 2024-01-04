import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial(changed: false));

  static FilterCubit of(context) => BlocProvider.of(context);
  final TextEditingController fromDate = TextEditingController();
  final TextEditingController toDate = TextEditingController();
  final TextEditingController vacationType = TextEditingController();
  final TextEditingController permissionType = TextEditingController();
  int dateFilter = 0;
  int timeFilter = 0;
  int employeeStatus = 0;
  bool absent = false;
  bool attended = false;
  bool vacancy = false;
  bool accepted = false;
  bool rejected = false;
  bool back = false;
  bool pending = false;
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

  void changeAbsentStatus() {
    absent = !absent;
    emit(FilterInitial(changed: !state.changed));
  }

  void changeAttendedStatus() {
    attended = !attended;
    emit(FilterInitial(changed: !state.changed));
  }

  void changeVacancyStatus() {
    vacancy = !vacancy;
    emit(FilterInitial(changed: !state.changed));
  }

  void changeAcceptedStatus() {
    accepted = !accepted;
    emit(FilterInitial(changed: !state.changed));
  }

  void changeRejectedStatus() {
    rejected = !rejected;
    emit(FilterInitial(changed: !state.changed));
  }

  void changeBackStatus() {
    back = !back;
    emit(FilterInitial(changed: !state.changed));
  }

  void changePendingStatus() {
    pending = !pending;
    emit(FilterInitial(changed: !state.changed));
  }
}
