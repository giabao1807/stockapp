// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:mtsv4/resource/app_colors.dart';

class StockTopModel {
  final String stockCode;
  num ceilingPrice;
  num floorPrice;
  num referencePrice;
  num openPrice;
  num closePrice;
  num hightestPrice;
  num lowestPrice;
  num tradingVolumn;
  num tradingValue;
  num currentPrice;
  num changeValue;
  num changRatio;
  num fbv;
  num fba;
  num fsv;
  num fsa;
  StockTopModel({
    required this.stockCode,
    required this.ceilingPrice,
    required this.floorPrice,
    required this.referencePrice,
    required this.openPrice,
    required this.closePrice,
    required this.hightestPrice,
    required this.lowestPrice,
    required this.tradingVolumn,
    required this.tradingValue,
    required this.currentPrice,
    required this.changeValue,
    required this.changRatio,
    required this.fbv,
    required this.fba,
    required this.fsv,
    required this.fsa,
  });

  Color getColor(num value) {
    if (value > 0 && value > floorPrice && value < referencePrice) {
      return AppColors.red;
    } else if (value > 0 && value < ceilingPrice && value > referencePrice) {
      return AppColors.green;
    } else if (value == 0 || value == referencePrice) {
      return AppColors.yellow;
    } else if (value > 0 && value >= ceilingPrice) {
      return AppColors.purple;
    } else if (value > 0 && value <= floorPrice) {
      return AppColors.teal;
    }
    return AppColors.yellow;
  }

  factory StockTopModel.fromMap(Map<dynamic, dynamic> map) {
    return StockTopModel(
      stockCode: map['S'] as String,
      ceilingPrice: map['CE'] as num,
      floorPrice: map['FL'] as num,
      referencePrice: map['REF'] as num,
      openPrice: map['O'] as num,
      closePrice: map['C'] as num,
      hightestPrice: map['H'] as num,
      lowestPrice: map['L'] as num,
      tradingVolumn: map['TVOL'] as num,
      tradingValue: map['TVAL'] as num,
      currentPrice: map['CP'] as num,
      changeValue: map['CHGV'] as num,
      changRatio: map['CHGR'] as num,
      fbv: map['FBV'] as num,
      fba: map['FBA'] as num,
      fsv: map['FSV'] as num,
      fsa: map['FSA'] as num,
    );
  }

  factory StockTopModel.fromTopTradingByTimeJson(Map<String, dynamic> map) {
    return StockTopModel(
      stockCode: map['c3'] as String,
      ceilingPrice: 0,
      floorPrice: 0,
      referencePrice: 0,
      openPrice: 0,
      closePrice: 0,
      hightestPrice: num.parse(map['c6']),
      lowestPrice: num.parse(map['c4']),
      tradingVolumn: num.parse(map['c8']),
      tradingValue: num.parse(map['c9']),
      currentPrice: 0,
      changeValue: 0,
      changRatio: num.parse(map['c11']),
      fbv: 0,
      fba: 0,
      fsv: 0,
      fsa: 0,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'S': stockCode,
      'CE': ceilingPrice,
      'FL': floorPrice,
      'REF': referencePrice,
      'O': openPrice,
      'C': closePrice,
      'H': hightestPrice,
      'L': lowestPrice,
      'TVOL': tradingVolumn,
      'TVAL': tradingValue,
      'CP': currentPrice,
      'CHGV': changeValue,
      'CHGR': changRatio,
      'FBV': fbv,
      'FBA': fba,
      'FSV': fsv,
      'FSA': fsa,
    };
  }
}
