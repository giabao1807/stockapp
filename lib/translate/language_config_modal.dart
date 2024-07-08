import 'package:get/get_navigation/get_navigation.dart';

class LanguagesConfigModal {
  String languageName;
  String languageCode;
  String countryCode;

  LanguagesConfigModal({
    required this.languageName,
    required this.languageCode,
    required this.countryCode
  });
}

class LanguagesModal extends Translations {
  final Map<String, Map<String, String>> languages;
  LanguagesModal({required this.languages});

  @override 
  Map<String, Map<String, String>> get keys{
    return languages;
  }
}