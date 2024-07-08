import 'package:flutter/cupertino.dart';
import 'package:mtsv4/widgets/enum/password_utils.dart';

import 'data_request.dart';

class AuthenticateRequestModel extends DataRequest {
  final TextEditingController txtUserName;
  final TextEditingController txtPassword;
  final String? deviceUUID;
  final String? appId;
  final String autoFlag;
  final String? deviceLoginInfo;

  AuthenticateRequestModel({
    required String username,
    required String password,
    this.deviceUUID,
    this.appId,
    required this.autoFlag,
    this.deviceLoginInfo,
  })  : txtUserName = TextEditingController(text: username),
        txtPassword = TextEditingController(text: password);

  factory AuthenticateRequestModel.init() => AuthenticateRequestModel(
        username: '',
        password: '',
        // username: '888C000352',
        // password: 'hello1',
        autoFlag: 'n',
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': txtUserName.text,
      'password': PasswordUtils.encryptString(txtPassword.text),
      'deviceUUID': deviceUUID,
      'appId': appId,
      'autoFlag': autoFlag,
      'deviceLoginInfo': deviceLoginInfo,
    };
  }

  List<String> get inVal =>
      toMap().values.map((e) => e?.toString() ?? '').toList();
}

class CheckOTPRequest extends DataRequest {
  late String otp;

  CheckOTPRequest.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    otp = json['otp'];
  }
}

class LogoutRequest extends DataRequest {
  late String loginId;
  String? deviceUUID;

  LogoutRequest.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);

    loginId = json['loginId'];
    deviceUUID = json['deviceUUID'];
  }
}
