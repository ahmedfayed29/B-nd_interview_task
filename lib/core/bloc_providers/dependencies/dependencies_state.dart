part of 'dependencies_cubit.dart';

abstract class DependenciesState extends Equatable {
  final bool changed;
  final DependenciesModel dependenciesModel;
  const DependenciesState(
      {required this.dependenciesModel, required this.changed});
}

class DependenciesInitial extends DependenciesState {
  DependenciesInitial(
      {required super.changed, required super.dependenciesModel});

  @override
  List<Object> get props => [changed];
}
