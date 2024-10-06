import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:learnify_client/helpers/dio_helper.dart';
import 'package:learnify_client/helpers/hive_helper.dart';
import 'package:learnify_client/login_model.dart';
import 'package:learnify_client/screens/bottomNav/bottom_nav.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  LoginModel model = LoginModel();
  String? username;
  void login({
    required String email,
    required String password,

  }) async {
    emit(LoginLoadingState());
    try {
      final response = await DioHelper.postData(
          path: 'login',
          body: {
            "email": email,
            "password": password,

          });
      model = LoginModel.fromJson(response.data);
      if (model.status == true) {

        HiveHelper.setToken(model.data?.token ?? "");

        Get.offAll(BottomNav());

        emit(LoginSuccessState(model.message ?? ""));
      } else {
        emit(
          LoginErorrState(model.message ?? ""),
        );
      }
    } catch (e) {
      emit(LoginErorrState("Connection is bad "));
    }
  }
}
