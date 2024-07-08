
import 'package:mtsv4/translate/language_config_modal.dart';

class LanguageConstant{
  static const String COUNTRY_CODE = 'country_code';
  static const LANGUAGE_CODE = 'language_code';

  static List<LanguagesConfigModal> languages = [
    LanguagesConfigModal(languageName: 'English', languageCode: 'en', countryCode: 'US'),
    LanguagesConfigModal(languageName: 'Vietnam', languageCode: 'vi', countryCode: 'VI'),
    LanguagesConfigModal(languageName: 'Korea', languageCode: 'ko', countryCode: 'KO'),
    LanguagesConfigModal(languageName: 'Chinese simplified', languageCode: 'zh', countryCode: 'CN'),
    LanguagesConfigModal(languageName: 'Chinese traditional', languageCode: 'cn', countryCode: 'CN'),
  ];
}
