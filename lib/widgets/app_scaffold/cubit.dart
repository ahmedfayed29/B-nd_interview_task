import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/core/route_utils/route_utils.dart';
import 'package:hr_app/features/attend_and_out/view.dart';
import 'package:hr_app/features/home/view.dart';
import 'package:hr_app/res.dart';
import 'package:hr_app/widgets/app_scaffold/app_scaffold.dart';

part 'states.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit() : super(NavBarInit());

  static NavBarCubit of(context) => BlocProvider.of(context);

  int currentPage = 0;

  void changePage(int? page, {bool forceNav = false}) {
    if (page != null) {
      if (forceNav) {
        RouteUtils.navigateAndReplace(AppScaffold(
          currentPage: page,
        ));
      } else {
        currentPage = page;
        _emit(NavBarInit());
      }
    }
  }

  void addContent() {
    content.add(
      [
        Res.home_on,
        Res.home_off,
        tr('home'),
        HomeView(),
      ],
    );
    content.add(
      [
        Res.attendance_on,
        Res.attendance_off,
        tr('attendance'),
        AttendAndOutView(),
      ],
    );
    content.add([
      Res.profile_on,
      Res.profile_off,
      tr('profile'),
      Container(),
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
