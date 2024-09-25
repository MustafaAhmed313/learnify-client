import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_change_state.dart';

class TabChangeCubit extends Cubit<TabChangeState> {
  TabChangeCubit() : super(TabChangeInitial());

  int tabNumber = 0;

  void setTabNumber(int number) {
    tabNumber = number;
    emit(TabChanged());
  }
}
