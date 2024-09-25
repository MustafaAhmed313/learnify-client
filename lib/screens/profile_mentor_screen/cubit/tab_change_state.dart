part of 'tab_change_cubit.dart';

@immutable
sealed class TabChangeState {}

final class TabChangeInitial extends TabChangeState {}

final class TabChanged extends TabChangeState {}
