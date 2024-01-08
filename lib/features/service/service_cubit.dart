import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/data_sources/auth/auth_data_source.dart';
import 'package:hr_app/core/models/service_model.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceLoading(changed: false));

  static ServiceCubit of(context) => BlocProvider.of(context);

  final List<ServiceModel> services = [];
  final List<ServiceModel> popularService = [];

  Future<void> initState() async {
    await Future.wait([
      getServices(),
      getPopularServices(),
    ]);
    emit(ServiceInitial(changed: !state.changed));
  }

  Future<void> getServices() async {
    services.clear();
    final res = await AuthDataSource.getServices();
    services.addAll(res);
  }

  Future<void> getPopularServices() async {
    services.clear();
    final res = await AuthDataSource.getPopularServices();
    popularService.addAll(res);
  }
}
