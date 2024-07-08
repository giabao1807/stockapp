import 'package:get/get.dart';

// ignore: camel_case_types
enum STOCK_TYPE {
  ST,
  BO,
  CW,
  FU,
  OP,
}

extension StockType on STOCK_TYPE {
  static const types = {
    STOCK_TYPE.ST: 'stock',
    STOCK_TYPE.BO: 'bonds',
    STOCK_TYPE.CW: 'cover_warrant',
    STOCK_TYPE.FU: 'future',
    STOCK_TYPE.OP: 'options',
  };

  String? get type => types[this]?.tr;
}
