part of 'setting_content_cubit.dart';

@immutable
sealed class SettingContentState {}

final class SettingContentInitial extends SettingContentState {}
final class SettingContentSwitchInitial extends SettingContentState {}
final class SettingSearch extends SettingContentState {}
final class SettingSearchButton extends SettingContentState {}