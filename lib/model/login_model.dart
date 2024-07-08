// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:mtsv4/model/selectable_item.dart';
import 'package:mtsv4/utils/enum/account_type.dart';
import 'package:mtsv4/utils/enum/customer_type.dart';
import 'package:mtsv4/utils/enum/enum_utils.dart';
import 'package:mtsv4/utils/enum/login_type.dart';
import 'package:mtsv4/widgets/time_utils.dart';

enum AuthenFlag { Y, W, N }

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

class LoginModel {
  LoginModel({
    required this.sessionId,
    required this.id,
    required this.loginName,
    required this.shortName,
    required this.customerType,
    required this.resetPassword,
    required this.otpType,
    required this.singleSession,
    required this.twoFactor,
    required this.loginType,
    required this.accountList,
    required this.otpAtLogin,
    required this.otpExpired,
    required this.accountNo,
    required this.mainDevice,
    required this.accessToken,
    required this.refreshToken,
    required this.avatar,
    required this.authenFlag,
    required this.tradingDate,
    required this.custNo,
    required this.isAgreeUserProtectionPolicy,
  });

  final String sessionId;
  final String id;
  final String loginName;
  final String shortName;
  final CUSTOMER_TYPE customerType;
  final bool resetPassword;
  String otpType;
  final bool singleSession;
  AuthenFlag authenFlag;
  final bool twoFactor;
  final LOGIN_TYPE loginType;
  final List<AccountResponse> accountList;
  final String otpAtLogin;
  final int otpExpired;
  final String accountNo;
  bool mainDevice;
  final String accessToken;
  final String refreshToken;
  String avatar;
  final DateTime tradingDate;
  String custNo;
  final bool isAgreeUserProtectionPolicy;

  bool get isLoginSocial =>
      loginType == LOGIN_TYPE.G ||
      loginType == LOGIN_TYPE.F ||
      loginType == LOGIN_TYPE.APL;

  List<SelectableItem> get subAccounts => accountList
      .map(
        (e) => SelectableItem(
          id: e.subNumber,
          name: e.subNumber,
        ),
      )
      .toList();

  factory LoginModel.fromJson(Map<dynamic, dynamic> json) {
    List<AccountResponse> accounts = [];
    for (final item in (json['c12'] as String).split('|')) {
      final acc = item.split(',');
      if (acc.length >= 7) {
        accounts.add(AccountResponse.fromList(acc));
      }
    }
    return LoginModel(
      sessionId: json["c0"],
      id: json["c1"],
      loginName: json["c2"],
      shortName: json["c3"],
      customerType: CustomerTypeExt.getCustomerTypeFromString(json['c4']),
      resetPassword: json["c5"] == 'Y',
      otpType: json['c6'],
      singleSession: json["c8"] == 'Y',
      twoFactor: json["c10"] == 'Y',
      loginType:
          EnumHelper.enumFromString<LOGIN_TYPE>(LOGIN_TYPE.values, json["c11"]),
      accountList: accounts,
      otpAtLogin: json["c13"],
      otpExpired: int.parse(json["c15"]),
      accountNo: json["c19"],
      mainDevice: json["c20"] == 'Y',
      accessToken: json["c21"],
      refreshToken: json["c22"],
      avatar: json["c23"],
      authenFlag: EnumHelper.enumFromString<AuthenFlag>(
        AuthenFlag.values,
        json['c9'],
      ),
      tradingDate: TimeUtils.covertDateTime(json['c16']),
      custNo: json['c34'] ?? '',
      isAgreeUserProtectionPolicy: json['c35'] == 'N',
    );
  }
}

class AccountResponse {
  final String accountNumber;
  final String subNumber;
  final String accountName;
  final ACCOUNT_TYPE accountType;
  final bool owner;
  final String secCode;
  final String productCode;

  AccountResponse({
    required this.accountNumber,
    required this.subNumber,
    required this.accountName,
    required this.accountType,
    required this.owner,
    required this.secCode,
    required this.productCode,
  });

  factory AccountResponse.fromJson(Map<String, dynamic> json) =>
      AccountResponse(
        accountNumber: json['accountNumber'],
        subNumber: json['subNumber'],
        accountName: json['accountName'],
        accountType: ACCOUNT_TYPE.values.firstWhere(
            (e) => e.id == int.parse(json['accountType'].toString())),
        owner: json['owner'] == 'Y',
        secCode: json['secCode'],
        productCode: json['productCode'],
      );

  factory AccountResponse.fromList(List<String> list) => AccountResponse(
        accountNumber: list[0],
        subNumber: list[1],
        accountName: list[2],
        accountType:
            ACCOUNT_TYPE.values.firstWhere((e) => e.id == int.parse(list[3])),
        owner: list[4] == 'Y' ? true : false,
        secCode: list[5],
        productCode: list[6],
      );

  AccountResponse copyWith({
    String? accountNumber,
    String? subNumber,
    String? accountName,
    ACCOUNT_TYPE? accountType,
    bool? owner,
    String? secCode,
    String? productCode,
  }) {
    return AccountResponse(
      accountNumber: accountNumber ?? this.accountNumber,
      subNumber: subNumber ?? this.subNumber,
      accountName: accountName ?? this.accountName,
      accountType: accountType ?? this.accountType,
      owner: owner ?? this.owner,
      secCode: secCode ?? this.secCode,
      productCode: productCode ?? this.productCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountNumber': accountNumber,
      'subNumber': subNumber,
      'accountName': accountName,
      'accountType': (ACCOUNT_TYPE.values.indexOf(accountType) + 1).toString(),
      'owner': owner ? 'Y' : 'N',
      'secCode': secCode,
      'productCode': productCode,
    };
  }
}
