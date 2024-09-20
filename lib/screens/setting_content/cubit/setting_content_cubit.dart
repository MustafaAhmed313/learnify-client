import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:learnify_client/screens/setting_content/models/setting_content_model.dart';
import 'package:meta/meta.dart';

part 'setting_content_state.dart';

class SettingContentCubit extends Cubit<SettingContentState> {
  SettingContentCubit() : super(SettingContentInitial()) {
    filteredSetting = settingContentModel;
    searchController.addListener(() {
      filteredSearchResults(searchController.text);
    });
  }
  bool isSearching = false;

  TextEditingController searchController = TextEditingController();
  List<SettingContentModel> filteredSetting = [];

  void filteredSearchResults(String query) {
    List<SettingContentModel> tempList = [];
    if (query.isNotEmpty) {
      tempList = settingContentModel
          .where(
              (item) => item.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      tempList = settingContentModel;
    }

    filteredSetting = tempList;
    emit(SettingSearch());
  }

  void searchButton() {
    isSearching = !isSearching;
    if (!isSearching) {
      searchController.clear();
    }
    emit(SettingSearchButton());
  }

  void talkBackSwitch(SettingContentModel model, bool value) {
    model.isSwitched = value;
    emit(SettingContentSwitchInitial());
  }
}
