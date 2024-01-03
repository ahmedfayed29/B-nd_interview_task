part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  final bool changed;
  const ProfileState({required this.changed});
}

class ProfileInitial extends ProfileState {
  ProfileInitial({required super.changed});

  @override
  List<Object> get props => [changed];
}
