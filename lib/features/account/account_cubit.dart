import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial(changed: false));

  static AccountCubit of(context) => BlocProvider.of(context);

  int currentPage = 1;

  void changePage(int page) {
    currentPage = page;
    emit(AccountInitial(changed: !state.changed));
  }
}
