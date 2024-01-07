import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/features/home/view.dart';
import 'package:hr_app/features/profile/view.dart';
import 'package:hr_app/res.dart';

part 'states.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit() : super(NavBarInit());

  static NavBarCubit of(context) => BlocProvider.of(context);

  int currentPage = 0;

  void changePage(int? page, {bool forceNav = false}) {
    if (page != null) {
      currentPage = page;
      _emit(NavBarInit());
    }
  }

  void addContent() {
    content.add(
      [
        Res.user_on,
        Res.user_off,
        tr('who_am_i'),
        HomeView(),
      ],
    );
    content.add(
      [
        Res.countries_on,
        Res.countries_off,
        tr('countries'),
        Container(),
      ],
    );
    content.add([
      Res.service_on,
      Res.service_off,
      tr('services'),
      ProfileView(),
    ]);
  }

  List<List> content = [];

  String get currentTitle => content[currentPage][2];

  Widget get currentView => content[currentPage][3];

  void _emit(NavBarStates state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
