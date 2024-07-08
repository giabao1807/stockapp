import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mtsv4/utils/enum/market_type.dart';
import 'package:mtsv4/utils/enum/trading_session_status.dart';
import 'package:mtsv4/utils/extension/string_extension.dart';

List<IndexModel> listIndexModelFromJson(String str) => List<IndexModel>.from(
      json.decode(str).map(
            (x) => IndexModel.fromJson(x),
          ),
    );

class IndexModel {
  final String countryCode;
  final String indexCode;
  final String parentIndexCode;
  final String indexName;
  final DateTime updateTime;
  num indexValue;
  num changeAmount;
  num changeRatio;
  final MARKET market;
  final TradingSessionStatus status;
  num open;
  num rangeStart;
  num rangeEnd;
  num volume;
  num value;
  num worth;

  IndexModel({
    required this.countryCode,
    required this.indexCode,
    required this.parentIndexCode,
    required this.indexName,
    required this.updateTime,
    required this.indexValue,
    required this.changeAmount,
    required this.changeRatio,
    required this.market,
    this.status = TradingSessionStatus.NONE,
    this.open = 0,
    this.rangeStart = 0,
    this.rangeEnd = 0,
    this.volume = 0,
    this.value = 0,
    this.worth = 0,
  });

  // Color get color => changeRatio.color;
  Color get color => Colors.green;

  factory IndexModel.init(String indexCode) => IndexModel(
        countryCode: '',
        indexCode: indexCode,
        parentIndexCode: '',
        indexName: '',
        updateTime: DateTime.now(),
        indexValue: 0,
        changeAmount: 0,
        changeRatio: 0,
        market: MARKET.NONE,
      );

  factory IndexModel.fromJson(Map<String, dynamic> json) => IndexModel(
      countryCode: json["c0"],
      indexCode: json["c1"],
      parentIndexCode: json["c2"],
      indexName: json["c3"],
      // updateTime: DateFormat('HH:mm:ss').parse(json["c4"]),
      updateTime: DateTime.now(),
      indexValue: (json["c5"] as String).toNum,
      changeAmount: (json["c6"] as String).toNum,
      changeRatio: (json["c7"] as String).toNum,
      // market: EnumHelper.enumFromString(MARKET.values, json["c8"]),
      market: MARKET.HSX);
}
