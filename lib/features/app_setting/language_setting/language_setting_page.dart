import 'package:flutter/material.dart';
import 'package:mtsv4/application_config.dart';
import 'package:mtsv4/common/custom_app_bar.dart';
import 'package:mtsv4/extentions.dart';
import 'package:mtsv4/features/app_setting/language_setting/language_setting_presenter.dart';
import 'package:mtsv4/features/app_setting/language_setting/language_setting_view.dart';
import 'package:mtsv4/global/global_sv.dart';
import 'package:mtsv4/styles/theme/colors.dart';
import 'package:mtsv4/utils/common.dart';

class LanguageSetting extends StatefulWidget {
  const LanguageSetting({super.key});

  @override
  State<LanguageSetting> createState() => _LanguageSettingState();
}

class _LanguageSettingState extends State<LanguageSetting>
    implements LanguageView {
  late ChangeLanguagePresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = ChangeLanguagePresenter(this);
  }

  @override
  void toast(String message, BuildContext context) {
    // TODO: implement toast
  }

  @override
  Widget build(BuildContext context) {
    List<String> listLanguages = appConfig!.language_list;

    return Scaffold(
      appBar: CustomAppBar(title: 'lang_setting'),
      body: SafeArea(
          child: Column(children: [
        for (String item in listLanguages)
          if (item == 'vi')
            CustomLanguageButton(
              label: 'Tiếng Việt',
              onPressed: () => presenter.handlChangeLanguage(item, context),
              item: item,
            )
          else if (item == 'en')
            CustomLanguageButton(
                label: 'English',
                onPressed: () => presenter.handlChangeLanguage(item, context),
                item: item)
          else if (item == 'cn')
            CustomLanguageButton(
                label: '简体中文(CN)',
                onPressed: () => presenter.handlChangeLanguage(item, context),
                item: item)
          else if (item == 'zh')
            CustomLanguageButton(
                label: '繁體中文(ZH)',
                onPressed: () => presenter.handlChangeLanguage(item, context),
                item: item)
          else if (item == 'ko')
            CustomLanguageButton(
                label: '한국어',
                onPressed: () => presenter.handlChangeLanguage(item, context),
                item: item)
      ])),
    );
  }
}

class CustomLanguageButton extends StatelessWidget {
  final String label;
  final String item;
  final VoidCallback onPressed;
  const CustomLanguageButton(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom:
              BorderSide(color: styles['DIVIDER__COLOR']!.toColor(), width: 1),
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: styles['PRIMARY__BG__COLOR']!.toColor(),
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                  color: baseIsEqual(item, glb_sv.language)
                      ? styles['PRIMARY']!.toColor()
                      : styles['PRIMARY__CONTENT__COLOR']!.toColor()),
            ),
            if (baseIsEqual(item, glb_sv.language))
              Icon(Icons.check, color: styles['PRIMARY']!.toColor())
            else
              Icon(Icons.check, color: styles['PRIMARY__BG__COLOR']!.toColor()),
          ],
        ),
      ),
    );
  }
}
