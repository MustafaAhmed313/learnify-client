import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/hive_helper.dart';

part 'language_state.dart';

final String defaultLocale = Platform.localeName;
// final String defaultLocale = "ar";

class LanguageCubit extends Cubit<LanguageState> {
  static Locale? _locale = cachedLanguage == null
      ? defaultLocale.substring(0, 2) == 'ar'
          ? const Locale('ar', '')
          : const Locale('en', '')
      : Locale(cachedLanguage!, '');

  static String get currentLanguage => _locale!.toString();

  static String? get cachedLanguage => HiveHelper.getLanguage();

  // Passing an initial value (state) with a default 'Locale' to the super class.
  LanguageCubit()
      : super(
          SelectedLocale(
            cachedLanguage == null ? _locale! : Locale(cachedLanguage!, ''),
          ),
        ) {
    if (cachedLanguage == null) {
      HiveHelper.setLanguage(defaultLocale.substring(0, 2));
    }
  }

  // Once we call this method, the BlocBuilder<LanguageCubit>
  // in the 'main.dart' will rebuild the entire app with
  // the new emitted state that holds the 'ar' locale.
  void toArabic() {
    Get.updateLocale(Locale("ar"));
    HiveHelper.setLanguage('ar');
    emit(SelectedLocale(_locale = const Locale('ar', '')));
  }

  // Same as the previous method, but with the 'en' locale.
  void toEnglish() {
    Get.updateLocale(Locale("en"));
    HiveHelper.setLanguage('en');
    emit(SelectedLocale(_locale = const Locale('en', '')));
  }

  static bool get isArabic => currentLanguage == 'ar';

  static bool get isEnglish => currentLanguage == 'en';
}
