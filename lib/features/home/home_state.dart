part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  final bool changed;
  const HomeState({required this.changed});
}

class HomeInitial extends HomeState {
  HomeInitial({required super.changed});

  @override
  List<Object> get props => [changed];
}

class HomeLoading extends HomeState {
  HomeLoading({required super.changed});

  @override
  List<Object> get props => [changed];
}
