import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../helpers/dio_helper.dart';
import '../../helpers/hive_helper.dart';
import '../../register_model.dart';
import '../bottomNav/bottom_nav.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  RegisterModel model = RegisterModel();
  String? username;
  String? user;
  String? emaill;
  void Register({
    required String email,
    required String phone,
    required String username,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    try {
      final response = await DioHelper.postData(path: 'register', body: {
        "name": username,
        "phone": phone,
        "email": email,
        "password": password,
      });
      model = RegisterModel.fromJson(response.data);
      if (model.status == true) {
        HiveHelper.setToken(model.data?.token ?? "");
        HiveHelper.setValueLoginBox();
        user = model.data?.name;
        emaill = model.data?.email;

        var box = Hive.box('USER_BOX');
        box.put('username', username);
        box.put('email', email);

        Get.offAll(const BottomNav());

        emit(RegisterSuccessState(model.message ?? ""));
      } else {
        emit(
          RegisterErrorState(model.message ?? ""),
        );
      }
    } catch (e) {
      emit(RegisterErrorState("Connection is bad!"));
    }
  }
}
