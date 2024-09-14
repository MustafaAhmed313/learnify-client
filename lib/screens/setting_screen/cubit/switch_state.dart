part of 'switch_cubit.dart';

@immutable
sealed class SwitchState {}

final class SwitchInitial extends SwitchState {}

final class ChangeSwitch extends SwitchState {}
