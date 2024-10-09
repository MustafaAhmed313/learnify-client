part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {
  final String msge;
  RegisterSuccessState(this.msge);
}

final class RegisterErrorState extends RegisterState {
  final String msg;
  RegisterErrorState(this.msg);
}