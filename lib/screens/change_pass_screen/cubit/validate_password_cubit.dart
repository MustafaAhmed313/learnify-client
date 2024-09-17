import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'validate_password_state.dart';

class ValidatePasswordCubit extends Cubit<ValidatePasswordState> {
  ValidatePasswordCubit() : super(ValidatePasswordInitial()) {
    passwordController.addListener(() {
      validatePassword(passwordController.text);
    });

    confirmPasswordController.addListener(() {
      passwordsMatch =
          passwordController.text == confirmPasswordController.text;
    });
  }

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool obscureText = true;
  bool newPass = true;

  bool isLengthValid = false;
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasNumber = false;
  bool passwordsMatch = false;
  bool isInitial = true;
  void validatePassword(String password) {
    isInitial = false;
    isLengthValid = password.length >= 8;
    hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    hasLowerCase = password.contains(RegExp(r'[a-z]'));
    hasNumber = password.contains(RegExp(r'[0-9]'));
    passwordsMatch = passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        passwordController.text == confirmPasswordController.text;
    emit(ValidatePassword());
  }

  void newPassIcon() {
    newPass = !newPass;
    emit(NewPassIcon());
  }

  void confirmPassIcon() {
    obscureText = !obscureText;
    emit(ConfirmPassIcon());
  }
}
