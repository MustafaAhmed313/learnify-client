import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'help_center_state.dart';

class HelpCenterCubit extends Cubit<HelpCenterState> {
  late TabController tabController;
  HelpCenterCubit(TickerProvider tickerProvider) : super(HelpCenterInitial()) {
    tabController = TabController(length: 2, vsync: tickerProvider);
    emit(HelpCenterControllerInitialized(tabController));
  }

  void animatedToTab(int index) {
    tabController.animateTo(index);
    emit(HelpCenterControllerInitialized(tabController));
  }
}
