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
  
  // Removed duplicate user variables
  String? username;
  String? email;

  void Register({
    required String email,
    required String phone,
    required String name,  // Consistent usage of `username`
    required String password,
  }) async {
    emit(RegisterLoadingState());
    try {
      final response = await DioHelper.postData(path: 'register', body: {
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
      });
      model = RegisterModel.fromJson(response.data);
      if (model.status == true) {
        HiveHelper.setToken(model.data?.token ?? "");
        HiveHelper.setValueLoginBox();

        // Save username and email to Hive with correct keys
      this.username = model.data?.name; // Set the username here
        this.email = model.data?.email; // Set the email here

        var box = Hive.box('USER_BOX');
        box.put('user', this.username); // Store the username
        box.put('email', this.email); // St
        // Navigate to the BottomNav screen after successful registration
        Get.offAll(const BottomNav());

        emit(RegisterSuccessState(model.message ?? ""));
      } else {
        emit(RegisterErrorState(model.message ?? ""));
      }
    } catch (e) {
      emit(RegisterErrorState("Connection is bad!"));
    }
  }
}
