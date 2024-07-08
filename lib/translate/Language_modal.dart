import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'laguage_contrain.dart';
import 'language_config_modal.dart';

class LocalizationController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;
  LocalizationController({required this.sharedPreferences}) {
    loadCurrentLanguage();
  }
  Locale _locale = Locale(LanguageConstant.languages[0].languageCode,
      LanguageConstant.languages[0].countryCode);
  int _languageIndex = 0;
  int get selectedLanguageIndex => _languageIndex;

  List<LanguagesConfigModal> _languages = [];
  Locale get locale => _locale;
  set locale (Locale l) => locale = l;
  
  List<LanguagesConfigModal> get languages => _languages;


  void loadCurrentLanguage() async {
    _locale = Locale(
        sharedPreferences.getString(LanguageConstant.LANGUAGE_CODE) ??
            LanguageConstant.languages[0].languageCode,
        sharedPreferences.getString(LanguageConstant.COUNTRY_CODE) ??
            LanguageConstant.languages[0]
                .countryCode); // ensure got locale language information
    for (int index = 0; index < LanguageConstant.languages.length; index++) {
      if (LanguageConstant.languages[index].languageCode ==
          _locale.languageCode) {
        _languageIndex = index;
        break;
      }
    }
    _languages = [];
    _languages.addAll(LanguageConstant.languages);
    update();
  }
}
