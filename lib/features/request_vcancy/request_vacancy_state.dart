part of 'request_vacancy_cubit.dart';

abstract class RequestVacancyState extends Equatable {
  final bool changed;
  const RequestVacancyState({required this.changed});
}

class RequestVacancyInitial extends RequestVacancyState {
  RequestVacancyInitial({required super.changed});

  @override
  List<Object> get props => [changed];
}
