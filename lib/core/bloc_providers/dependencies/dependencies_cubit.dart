import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/models/dependencies_model.dart';
import 'package:hr_app/core/network_utils/network_utils.dart';

part 'dependencies_state.dart';

class DependenciesCubit extends Cubit<DependenciesState> {
  DependenciesCubit()
      : super(DependenciesInitial(
            changed: false,
            dependenciesModel: DependenciesModel(
                data: DataModel(socialMedia: [], tags: [], types: []))));

  // static DependenciesCubit get of => BlocProvider.of(RouteUtils.context);

  Future<void> init() async {
    await getDependencies();
  }

  Future<void> getDependencies() async {
    print("get dependencies");
    try {
      final response = await NetworkUtils.get('dependencies');
      print("res is ${response.data}");
      emit(DependenciesInitial(
          changed: !state.changed,
          dependenciesModel:
              DependenciesModel.fromJson(response.data['data'])));
    } catch (e, s) {
      print("e isss $e $s");
    }
  }
}
