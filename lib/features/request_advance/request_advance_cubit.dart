import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'request_advance_state.dart';

class RequestAdvanceCubit extends Cubit<RequestAdvanceState> {
  RequestAdvanceCubit() : super(RequestAdvanceInitial(changed: false));

  static RequestAdvanceCubit of(context) => BlocProvider.of(context);
  final TextEditingController advanceType = TextEditingController();
  final TextEditingController advanceAmount = TextEditingController();
  final TextEditingController advancePaymentNumber = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController paymentAmount = TextEditingController();
  final TextEditingController notes = TextEditingController();
}
