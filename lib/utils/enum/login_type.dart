import 'package:get/get.dart';

enum LOGIN_TYPE { P, E, I, A, L, F, G, APL, O }

extension LoginType on LOGIN_TYPE {
  static const types = {
    LOGIN_TYPE.P: 'phone',
    LOGIN_TYPE.E: 'email',
    LOGIN_TYPE.I: 'identity',
    LOGIN_TYPE.A: 'account_trading',
    LOGIN_TYPE.L: 'login_id',
    LOGIN_TYPE.F: 'faceBook',
    LOGIN_TYPE.G: 'gmail',
    LOGIN_TYPE.APL: 'apple',
    LOGIN_TYPE.O: 'other',
  };

  String? get type => types[this]?.tr;
}
