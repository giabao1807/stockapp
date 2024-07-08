import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:mtsv4/model/authentication_request_model.dart';
import 'package:mtsv4/model/login_model.dart';
import 'package:mtsv4/model/session_info.dart';
import 'package:mtsv4/repository/auth_repo.dart';
import 'package:mtsv4/resource/app_const.dart';
import 'package:mtsv4/widgets/app_dialogs.dart';
import 'package:mtsv4/widgets/app_snackbar.dart';
import 'package:mtsv4/widgets/enum/password_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AuthService extends GetxController {
  late final AuthRepo _repo = AuthRepo();

  AuthService();

  String deviceModel = '';
  String deviceOS = '';

  final Rxn<LoginModel?> loginModel = Rxn();

  final Rx<bool> hasLogin = RxBool(false);

  final Rxn<AccountResponse> selectedAccount = Rxn();

  FlutterSecureStorage get _storage => _repo.storage;

  final RxBool isVts = RxBool(false);

  final AuthenticateRequestModel model = AuthenticateRequestModel.init();

  final RxBool keepSession = RxBool(false);

  final RxBool hasValidate = RxBool(false);

  String? appID;

  String? deviceID;

  SessionInfo sessionInfo = SessionInfo.init();

  final RxInt timeoutOTP = RxInt(0);

  Timer? _otpTimer;

  Timer? get otpTimer => _otpTimer;

  final RxnString errorText = RxnString();

  String get userName => model.txtUserName.text;

  final RxBool isShowingFos = RxBool(false);

  onChanged(String value) {
    if (model.txtUserName.text.isNotEmpty &&
        model.txtPassword.text.length >= AppConst.limitLengthPasswordTemp) {
      hasValidate(true);
    } else {
      hasValidate(false);
    }
  }

  login(
    Function()? onLoginSuccess, {
    required List<String> params,
    bool shouldEncryptPassword = true,
  }) async {
    AppDialogs.showLoadingCircle();
    try {
      appID = await _getAppID();
      deviceID = await _getDeviceID();
      final String password = shouldEncryptPassword
          ? PasswordUtils.encryptString(model.txtPassword.text)
          : model.txtPassword.text;
      final info = await _getDeviceInfo();
      final result = await _repo.authenticate(params);
      sessionInfo.loginId = model.txtUserName.text;
      sessionInfo.passID = params[2];

      model.txtPassword.clear();
      handleLoginSuccess(result, onDone: () {
        AppDialogs.hideLoadingCircle();
        // if (onLoginSuccess != null) {
        //   onLoginSuccess.call();
        // } else {
        //   Get.back();
        //   Get.back();
        //   Get.back();
        // }
        Get.back();
      });
    } catch (e) {
      AppDialogs.hideLoadingCircle();
      AppDialogs.showDialog(
          title: 'notification'.tr,
          description: e.toString(),
          showCancelButton: true);
    }
  }

  Future<String?> getAppID() => _getAppID();

  Future<String?> _getAppID() async {
    // if (appID != null) return appID;
    // final status = await OneSignal.shared.getDeviceState();
    // final String? osUserID = status?.userId;
    // if (osUserID != null) {
    //   appID = osUserID;
    // }
    return '';
  }

  Future<String?> getDeviceID() => _getDeviceID();

  Future<String?> _getDeviceID() async {
    if (deviceID != null) return deviceID;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceID = androidInfo.fingerprint;
    } else {
      final iosInfo = await deviceInfo.iosInfo;
      deviceID = iosInfo.identifierForVendor;
    }

    return deviceID;
  }

  Future<String> getDeviceInfo() => _getDeviceInfo();

  Future<String> _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final List<String> value = [];
    final PackageInfo package = await PackageInfo.fromPlatform();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceModel = androidInfo.model;
      deviceOS = androidInfo.version.release;
      value.addAll(
        [
          androidInfo.model,
          androidInfo.board,
          package.buildNumber,
          androidInfo.version.release,
        ],
      );
    } else {
      final iosInfo = await deviceInfo.iosInfo;
      deviceModel = iosInfo.utsname.machine ?? '';
      deviceOS = iosInfo.systemVersion ?? '';
      value.addAll(
        [
          iosInfo.name ?? '',
          iosInfo.model ?? '',
          package.buildNumber,
          iosInfo.systemName ?? '',
          iosInfo.systemVersion ?? '',
        ],
      );
    }

    return value.join(';');
  }

  handleLoginSuccess(LoginModel result, {Function()? onDone}) async {
    loginModel(result);
    hasLogin(true);
    sessionInfo.sessionId = result.sessionId;
    sessionInfo.userID = result.id;
    sessionInfo.otp = '';

    if (result.accountList.isNotEmpty) {
      selectedAccount.value = result.accountList.first;
      isVts(false);
    }

    onDone?.call();
  }
}
