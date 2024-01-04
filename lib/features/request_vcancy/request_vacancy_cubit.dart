import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'request_vacancy_state.dart';

class RequestVacancyCubit extends Cubit<RequestVacancyState> {
  RequestVacancyCubit() : super(RequestVacancyInitial(changed: false));

  static RequestVacancyCubit of(context) => BlocProvider.of(context);
  final TextEditingController vacationType = TextEditingController();
  final TextEditingController vacationDaysCount = TextEditingController();
  final TextEditingController fromDate = TextEditingController();
  final TextEditingController toDate = TextEditingController();
  final TextEditingController replacementEmployee = TextEditingController();
}
