import 'package:bloc/bloc.dart';
import 'package:learnify_client/screens/setting_screen/models/setting_models.dart';
import 'package:meta/meta.dart';

part 'switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(SwitchInitial());

  void changeSwitch(SettingModels model, bool value) {
    model.isSwitched = value;
    emit(ChangeSwitch());
  }
}
