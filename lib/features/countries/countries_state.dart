part of 'countries_cubit.dart';

abstract class CountriesState extends Equatable {
  final bool changed;
  const CountriesState({required this.changed});
}

class CountriesInitial extends CountriesState {
  CountriesInitial({required super.changed});

  @override
  List<Object> get props => [changed];
}
