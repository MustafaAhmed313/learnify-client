import 'package:bloc/bloc.dart';
import 'package:learnify_client/screens/setting_content/models/setting_content_model.dart';
import 'package:meta/meta.dart';

part 'setting_content_state.dart';

class SettingContentCubit extends Cubit<SettingContentState> {
  SettingContentCubit() : super(SettingContentInitial());

  void talkBackSwitch(SettingContentModel model, bool value) {
    model.isSwitched = value;
    emit(SettingContentSwitchInitial());
  }
}
