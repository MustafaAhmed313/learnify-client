part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
   final String msge;
  LoginSuccessState(this.msge);
}

final class LoginErorrState extends LoginState {
  final String msg;
  LoginErorrState(this.msg);
}
