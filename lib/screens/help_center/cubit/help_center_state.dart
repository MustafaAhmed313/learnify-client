part of 'help_center_cubit.dart';

@immutable
sealed class HelpCenterState {}

final class HelpCenterInitial extends HelpCenterState {}

final class HelpCenterControllerInitialized extends HelpCenterState {
  final TabController tabController;

  HelpCenterControllerInitialized(this.tabController);
}