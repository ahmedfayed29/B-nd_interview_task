import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'states.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit() : super(NavBarInit());

  static NavBarCubit of(context) => BlocProvider.of(context);

  int currentPage = 0;

  void changePage(int page) {
    currentPage = page;
    _emit(NavBarInit());
  }

  void addContent() {
    // content.add(
    //   [Res.home, tr('home'), Container()],
    // );
    // content.add([Res.investment, tr('investment'), Container()]);
    // content.add([Res.chat, tr('chat'), Container()]);
  }

  List content = [];

  Widget get currentView => content[currentPage][2];

  void _emit(NavBarStates state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
