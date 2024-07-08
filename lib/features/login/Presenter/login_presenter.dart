import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mtsv4/common/show_alert.dart';
import 'package:mtsv4/global/global_sv.dart';
import 'package:mtsv4/features/login/views/login_view.dart';
import 'package:mtsv4/global/interface/i_service_info.dart';
import 'package:mtsv4/main.dart';
import 'package:mtsv4/presentation/auth_controller.dart';
import 'package:mtsv4/translate/laguage_contrain.dart';
import 'package:mtsv4/translate/language_config_modal.dart';

import 'package:mtsv4/utils/send_request.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../utils/data_cryption.dart';

var ServiceInfo = ISserviceInfo(
    reqFunct: 'LOGIN_FUNCTION',
    WorkerName: 'FOSxID02',
    ServiceName: 'FOSxID02_Login',
    operation: "U");

class LoginPresenter implements LoginPresenterInteraction {
  LoginView view;
  LoginPresenter(this.view);

  final controller = Get.find<AuthService>();

  @override
  void changeLanguage(String? lang) {
    // print('changeLanguage LoginPresenter ${lang}');
    switch (lang) {
      case 'en':
        glb_sv.changeLanguage(lang!, 'US');
        break;
      case 'zh':
        glb_sv.changeLanguage(lang!, 'CN');
        break;
      default:
        glb_sv.changeLanguage(lang!, lang.toUpperCase());
    }
  }

  @override
  void handleLogin(TextEditingController userNameCtr,
      TextEditingController passwordCtr, BuildContext context) {
    String passwordEncrypt = encryptString(passwordCtr.value.text);
    var inputParams = [
      'login',
      userNameCtr.text,
      passwordEncrypt,
      '',
      '',
      'N',
      glb_sv.getDeviceInfos()
    ];
    controller.login(() {}, params: inputParams);
  }

  bool validateLogin(
      TextEditingController userNameCtr, TextEditingController passwordCtr) {
    if (userNameCtr.value.text.isEmpty ||
        passwordCtr.value.text.isEmpty ||
        passwordCtr.value.text.length < 6) return false;
    return true;
  }

  Future<PackageInfo> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    return info;
  }
}
