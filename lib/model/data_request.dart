// ignore_for_file: unnecessary_this

import 'dart:convert';

class DataRequest {
  Headers? headers;

  DataRequest({this.headers});

  DataRequest.fromJson(Map<String, dynamic> json) {
    headers =
        json['headers'] != null ? Headers.fromJson(json['headers']) : null;
  }

  void fromJson(Map<String, dynamic> json) {
    headers =
        json['headers'] != null ? Headers.fromJson(json['headers']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.headers != null) data['headers'] = this.headers!.toJson();
    return data;
  }
}

class Headers {
  final String? lang;
  final String? platform;
  final String? publicip;
  final String? acceptLanguage;
  final Token? token;

  Headers(
      {this.lang,
      this.platform,
      this.publicip,
      this.token,
      this.acceptLanguage});

  factory Headers.fromJson(Map<String, dynamic> json) => Headers(
        lang: json['lang'],
        platform: json['platform'],
        publicip: json['publicip'],
        acceptLanguage: json['accept-language'],
        token: json['token'] != null ? Token.fromJson(json['token']) : null,
      );

  Map<String, dynamic> toJson() => {
        'lang': lang,
        'platform': platform,
        'publicip': publicip,
        'accept-language': acceptLanguage,
        if (token != null) 'json': token?.toJson(),
      };
}

class Token {
  final List<int>? sgIds;
  final List<int>? rIds;
  final UserData? ud;
  final Otp? otp;
  final bool? a;
  final String? pl;
  final String? loginUUID;
  final int? iat;
  final int? exp;

  Token(
      {this.sgIds,
      this.rIds,
      this.ud,
      this.otp,
      this.a,
      this.pl,
      this.loginUUID,
      this.iat,
      this.exp});

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        sgIds: json['sgIds']?.cast<int>(),
        a: json['a'],
        exp: json['exp'],
        loginUUID: json['loginUUID'],
        iat: json['iat'],
        otp: json['otp'] != null ? Otp.fromJson(json['otp']) : null,
        ud: json['ud'] != null ? UserData.fromJson(json['ud']) : null,
        pl: json['pl'],
        rIds: json['rIds']?.cast<int>(),
      );
  Map<String, dynamic> toJson() => {
        'sgIds': sgIds,
        'rIds': rIds,
        if (ud != null) 'ud': ud,
        if (otp != null) 'otp': otp?.toJson(),
        'a': a,
        'pl': pl,
        'loginUUID': loginUUID,
        'iat': iat,
        'exp': exp,
      };
}

class UserData {
  final String? u;
  final String? sid;
  final String? p;
  final int? i;
  final ExtraData? ex;

  UserData({
    this.u,
    this.sid,
    this.i,
    this.ex,
    this.p,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        u: json['u'],
        sid: json['sid'],
        i: json['i'],
        ex: json['ex'] != null ? ExtraData.fromJson(json['ex']) : null,
      );
  Map<String, dynamic> toJson() => {
        'u': this.u,
        'sid': this.sid,
        'i': this.i,
        if (this.ex != null) 'ex': this.ex!.toJson()
      };
}

class ExtraData {
  final String? id;
  final String? br;
  final String? mgnDpt;
  final String? dpt;
  final String? agc;
  final List<Map<String, dynamic>>? acc;
  final String? lgId;
  final String? flg;
  final String? tpl;
  final String? lvl;
  final String? ut;

  ExtraData(
      {this.id,
      this.br,
      this.mgnDpt,
      this.dpt,
      this.agc,
      this.acc,
      this.lgId,
      this.flg,
      this.tpl,
      this.lvl,
      this.ut});
  factory ExtraData.fromJson(Map<String, dynamic> json) => ExtraData(
        id: json['id'],
        br: json['br'],
        mgnDpt: json['mgnDpt'],
        dpt: json['dpt'],
        agc: json['agc'],
        acc: List.from(json['acc'].map((e) => jsonDecode(e))),
        flg: json['flg'],
        lgId: json['lgId'],
        lvl: json['lvl'],
        tpl: json['tpl'],
        ut: json['ut'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'br': br,
        'mgnDpt': mgnDpt,
        'dpt': dpt,
        'agc': agc,
        'acc': acc,
        'lgId': lgId,
        'flg': flg,
        'tpl': tpl,
        'lvl': lvl,
        'ut': ut,
      };
}

class Otp {
  final String? service;
  final String? uri;
  final String? otpType;
  final int? exp;

  Otp({this.service, this.uri, this.otpType, this.exp});

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        exp: json['exp'],
        service: json['service'],
        otpType: json['otpType'],
        uri: json['uri'],
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'service': service,
      'uri': uri,
      'otpType': otpType,
      'exp': exp,
    };
  }
}
