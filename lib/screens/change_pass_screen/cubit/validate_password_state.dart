part of 'validate_password_cubit.dart';

@immutable
sealed class ValidatePasswordState {}

final class ValidatePasswordInitial extends ValidatePasswordState {}
final class ValidatePassword extends ValidatePasswordState {}
final class NewPassIcon extends ValidatePasswordState {}
final class ConfirmPassIcon extends ValidatePasswordState {}



