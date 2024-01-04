import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'request_permission_state.dart';

class RequestPermissionCubit extends Cubit<RequestPermissionState> {
  RequestPermissionCubit() : super(RequestPermissionInitial(changed: false));

  static RequestPermissionCubit of(context) => BlocProvider.of(context);
  final TextEditingController permissionType = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController fromTime = TextEditingController();
  final TextEditingController toTime = TextEditingController();
  final TextEditingController reason = TextEditingController();
}
