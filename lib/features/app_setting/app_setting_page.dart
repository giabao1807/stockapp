import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtsv4/common/custom_ElevatedButton.dart';
import 'package:mtsv4/common/custom_app_bar.dart';
import 'package:mtsv4/features/app_setting/interface_setiing.dart';
import 'package:mtsv4/features/app_setting/language_setting/language_setting_page.dart';
import 'package:mtsv4/global/global_sv.dart';

class ApplicationSettingPage extends StatelessWidget {
  const ApplicationSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'app_settings'.tr),
      body: SafeArea(
        child: Column(children: [
          CustomButton(
              icon: 'assets/images/setting-display.svg',
              title: 'ui_setting',
              subTitle: glb_sv.theme.toLowerCase(),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThemeSetting(),
                    ));
              }),
          CustomButton(
              icon: 'assets/images/language.svg',
              title: 'lang_setting',
              subTitle: glb_sv.language.toLowerCase(),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const LanguageSetting() //--------------
                        ));
              }),
          CustomButton(
              icon: 'assets/images/server.svg',
              title: 'server_setting',
              subTitle: glb_sv.theme.toLowerCase(),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThemeSetting(),
                    ));
              }),
          CustomButton(
              icon: 'assets/images/ic_pencil_ruler.svg',
              title: 'price_qty_unit_setting',
              subTitle: '',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThemeSetting(),
                    ));
              }),
          CustomButton(
              icon: 'assets/images/ic_bell.svg',
              title: 'notify_setting',
              subTitle: '',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThemeSetting(),
                    ));
              })
        ]),
      ),
    );
  }
}
