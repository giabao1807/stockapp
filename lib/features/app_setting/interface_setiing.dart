import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mtsv4/common/custom_app_bar.dart';
import 'package:mtsv4/common/round_checkbox.dart';
import 'package:mtsv4/extentions.dart';
import 'package:mtsv4/global/global_sv.dart';
import 'package:mtsv4/styles/helper/dimentions.dart';
import 'package:mtsv4/styles/theme/colors.dart';

class ThemeSetting extends StatelessWidget {
  const ThemeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = glb_sv.theme.toUpperCase() == 'LIGHT' ? true : false;
    return Scaffold(
      appBar: CustomAppBar(title: 'ui_setting'),
      body: SafeArea(
          child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: styles['PRIMARY__BG__COLOR']!.toColor(),
                shadowColor: Colors.transparent),
            onPressed: () {
              glb_sv.changeTheme('LIGHT');
              isLightTheme == true;
            },
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SvgPicture.asset('assets/images/light.svg'),
              SizedBox(height: moderate(4)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RoundCheckBox(
                      isChecked: isLightTheme,
                      uncheckedColor: styles['PRIMARY__BG__COLOR']!.toColor(),
                      size: moderate(20),
                      onTap: (isLightTheme) {}),
                  SizedBox(width: vertical(4)),
                  Text("light_theme".tr,
                      style: TextStyle(
                        color: styles['PRIMARY__CONTENT__COLOR']!.toColor(),
                      ))
                ],
              )
            ]),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: styles['PRIMARY__BG__COLOR']!.toColor(),
                shadowColor: Colors.transparent),
            onPressed: () {
              glb_sv.changeTheme('DARK');
              isLightTheme == false;
            },
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SvgPicture.asset('assets/images/light.svg'),
              SizedBox(height: moderate(4)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RoundCheckBox(
                      isChecked: !isLightTheme,
                      uncheckedColor: styles['PRIMARY__BG__COLOR']!.toColor(),
                      size: moderate(20),
                      onTap: (isLightTheme) {}),
                  SizedBox(width: vertical(4)),
                  Text("dark_theme".tr,
                      style: TextStyle(
                        color: styles['PRIMARY__CONTENT__COLOR']!.toColor(),
                      ))
                ],
              )
            ]),
          )

          // Flexible(
          //   child: ElevatedButton(
          //       onPressed: () {
          //         glb_sv.changeTheme("DARK");
          //       },
          //       child: Column(mainAxisSize: MainAxisSize.min, children: [
          //         SvgPicture.asset('assets/images/dark.svg'),
          //         Text("dark_theme".tr)
          //       ])),
          // )
        ],
      )),
    );
  }
}
