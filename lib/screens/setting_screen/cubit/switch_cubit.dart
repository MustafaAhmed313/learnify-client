import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:learnify_client/screens/setting_screen/models/setting_models.dart';
import 'package:meta/meta.dart';

part 'switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(SwitchInitial()) {
    filteredSetting = settingModels;
    searchController.addListener(() {
      filteredSearchResults(searchController.text);
    });
  }
  bool isSearching = false;

  TextEditingController searchController = TextEditingController();
  List<SettingModels> filteredSetting = [];

  void filteredSearchResults(String query) {
    List<SettingModels> tempList = [];
    if (query.isNotEmpty) {
      tempList = settingModels
          .where(
              (item) => item.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      tempList = settingModels;
    }
    emit(SearchResults());
    filteredSetting = tempList;
  }

  void searchBoutton() {
    isSearching = !isSearching;
    if (!isSearching) {
      searchController.clear();
    }
    emit(SearchButton());
  }

  void changeSwitch(SettingModels model, bool value) {
    model.isSwitched = value;
    emit(ChangeSwitch());
  }
}
