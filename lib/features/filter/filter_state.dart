part of 'filter_cubit.dart';

abstract class FilterState extends Equatable {
  final bool changed;
  const FilterState({required this.changed});
}

class FilterInitial extends FilterState {
  FilterInitial({required super.changed});

  @override
  List<Object> get props => [changed];
}
