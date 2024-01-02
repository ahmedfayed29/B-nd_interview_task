import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'attend_state.dart';

class AttendCubit extends Cubit<AttendState> {
  AttendCubit() : super(AttendInitial(changed: false));

  static AttendCubit of(context) => BlocProvider.of(context);
  int selected = 0;
  void changeSelected({required int value}) {
    selected = value;
    emit(AttendInitial(changed: !state.changed));
  }
}
