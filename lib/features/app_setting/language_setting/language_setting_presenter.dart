import 'package:flutter/src/widgets/framework.dart';
import 'package:mtsv4/features/app_setting/language_setting/language_setting_view.dart';
import 'package:mtsv4/global/global_sv.dart';

class ChangeLanguagePresenter implements LanguagePresenterInteraction {
  LanguageView view;
  ChangeLanguagePresenter(this.view);

  @override
  void handlChangeLanguage(String item, BuildContext context) {
    glb_sv.changeLanguage(item, item);
    // TODO: implement handlChangeLanguage
  }
}