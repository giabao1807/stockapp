// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mtsv4/application_config.dart';
import 'package:mtsv4/common/custom_ElevatedButton.dart';

import 'package:mtsv4/extentions.dart';
import 'package:mtsv4/features/app_setting/app_setting_page.dart';
import 'package:mtsv4/features/login/login_page.dart';
import 'package:mtsv4/presentation/auth_controller.dart';
import 'package:mtsv4/styles/helper/dimentions.dart';
import 'package:mtsv4/styles/helper/font_size.dart';
import 'package:mtsv4/styles/theme/colors.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = Get.find();

    return SafeArea(
      child: Column(
        children: [
          Obx(() => _auth.hasLogin.value
              ? const SizedBox()
              : Container(
                  alignment: Alignment.topCenter,
                  // top: true,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            styles['PRIMARY__BG__COLOR']!.toColor(),
                        minimumSize: Size.fromHeight(moderate(60)),
                        shadowColor: Colors.transparent),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/images/ic_user.svg',
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'login'.tr,
                          style: TextStyle(
                            fontSize: fontSizes.medium,
                            fontWeight: FontWeight.w700,
                            color: styles['PRIMARY__CONTENT__COLOR']!.toColor(),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
              icon: 'assets/images/setting.svg',
              title: 'app_settings',
              subTitle: 'app_setting_notes',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ApplicationSettingPage(),
                    ));
              }),
          CustomButton(
              icon: 'assets/images/ic_user_guide.svg',
              title: 'tutorial',
              subTitle: 'user_guide_description',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ApplicationSettingPage(),
                    ));
              }),
          CustomButton(
              icon: 'assets/images/ic_feedback.svg',
              title: 't_feedback',
              subTitle: 'feedback',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ApplicationSettingPage(),
                    ));
              }),
          CustomButton(
              icon: 'assets/images/bussiness.svg',
              title: 'about_us',
              subTitle: '${'about_us'.tr} ${appConfig!.comp_full}',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ApplicationSettingPage(),
                    ));
              })
        ],
      ),
    );
  }
}
