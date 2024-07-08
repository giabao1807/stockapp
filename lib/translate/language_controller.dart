import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:mtsv4/translate/Language_modal.dart';

import 'package:mtsv4/translate/language_config_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'laguage_contrain.dart';

Future<Map<String, Map<String, String>>> init() async {
  const listConfigHasDifLang = ["102", "081"];

  final sharedPreference = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreference);
  String activeCode =
      FlutterConfig.get('SECCODE') ?? 'khong load duoc file env';

  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  if (listConfigHasDifLang.contains(activeCode)) {
    Map<String, Map<String, String>> languages = {};
    for (LanguagesConfigModal languageModal in LanguageConstant.languages) {
      String jsonStringValues = await rootBundle.loadString(
          'lib/translate/languages/${languageModal.languageCode}.json');
      String jsonStringCompanyLanguage = await rootBundle.loadString(
          'lib/translate/languages/$activeCode/$activeCode-${languageModal.languageCode}.json');
      Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
      Map<String, dynamic> mappedCompanyLangJson =
          jsonDecode(jsonStringCompanyLanguage);
      mappedJson.addAll(mappedCompanyLangJson);
      Map<String, String> json = {};

      mappedJson.forEach((key, value) {
        json[key] = value.toString();
      });
      languages['${languageModal.languageCode}_${languageModal.countryCode}'] =
          json;
    }
    return languages;
  } else {
    Map<String, Map<String, String>> languages = {};
    for (LanguagesConfigModal languageModal in LanguageConstant.languages) {
      String jsonStringValues = await rootBundle.loadString(
          'lib/translate/languages/${languageModal.languageCode}.json');
      Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
      Map<String, String> json = {};
      mappedJson.forEach((key, value) {
        json[key] = value.toString();
      });
      languages['${languageModal.languageCode}_${languageModal.countryCode}'] =
          json;
    }
    return languages;
  }
}
