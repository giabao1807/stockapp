// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';
import 'package:mtsv4/resource/app_colors.dart';
import 'package:mtsv4/utils/enum/enum_utils.dart';
import 'package:mtsv4/utils/enum/market_type.dart';
import 'package:mtsv4/utils/enum/stock_type.dart';

class StockModel {
  final MARKET market;
  final String stockCode;
  final String stockName;
  final STOCK_TYPE? stockType;
  num value;
  num change;
  num ratioChange;
  num openPrice;
  num closePrice;
  num highestPrice;
  num lowestPrice;
  num volume;
  num totalTradingValue;
  num time;
  num matchPrice;
  num matchQtty;
  num refercencePrice;
  num ceilingPrice;
  num floorPrice;
  num tradingVolumn;
  num tradingValue;
  num currentPrice;
  num changeValue;
  num changRatio;
  num cap;
  num fbv;
  num fba;
  num fsv;
  num fsa;
  num totalVolume;
  num buyForeignQtty;
  num sellForeignQtty;
  num remainForeignQtty;
  num u35;
  num u36;
  num u37;
  num u38;
  num u39;
  num u40;
  num u41;

  num bpb1;
  num bvb1;
  num apb1;
  num avb1;
  num bpb2;
  num bvb2;
  num apb2;
  num avb2;
  num bpb3;
  num bvb3;
  num apb3;
  num avb3;
  DateTime? tradingDate;
  bool get isHose => market == MARKET.HSX;

  StockModel({
    this.market = MARKET.NONE,
    required this.stockCode,
    required this.stockName,
    this.stockType,
    this.value = 0,
    this.change = 0,
    this.ratioChange = 0,
    this.openPrice = 0,
    this.closePrice = 0,
    this.highestPrice = 0,
    this.lowestPrice = 0,
    this.volume = 0,
    this.totalTradingValue = 0,
    this.time = 0,
    this.refercencePrice = 0,
    this.ceilingPrice = 0,
    this.floorPrice = 0,
    this.tradingVolumn = 0,
    this.tradingValue = 0,
    this.currentPrice = 0,
    this.changeValue = 0,
    this.changRatio = 0,
    this.cap = 0,
    this.fbv = 0,
    this.fba = 0,
    this.fsv = 0,
    this.fsa = 0,
    this.bpb1 = 0,
    this.bvb1 = 0,
    this.apb1 = 0,
    this.avb1 = 0,
    this.bpb2 = 0,
    this.bvb2 = 0,
    this.apb2 = 0,
    this.avb2 = 0,
    this.bpb3 = 0,
    this.bvb3 = 0,
    this.apb3 = 0,
    this.avb3 = 0,
    this.matchPrice = 0,
    this.matchQtty = 0,
    this.totalVolume = 0,
    this.buyForeignQtty = 0,
    this.sellForeignQtty = 0,
    this.remainForeignQtty = 0,
    this.u35 = 0,
    this.u36 = 0,
    this.u37 = 0,
    this.u38 = 0,
    this.u39 = 0,
    this.u40 = 0,
    this.u41 = 0,
    this.tradingDate,
  });

  num get max => [avb1, avb2, avb3, bvb1, bvb2, bvb3]
      .reduce((curr, next) => curr > next ? curr : next);

  factory StockModel.init(String stockCode) => StockModel(
        stockCode: stockCode,
        stockName: '',
      );

  Color get color => getColor(value);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stockCode': stockCode,
      'stockName': stockName,
      'value': value,
      'change': change,
      'ratioChange': ratioChange,
      'openPrice': openPrice,
      'closePrice': closePrice,
      'highestPrice': highestPrice,
      'lowestPrice': lowestPrice,
      'volume': volume,
      'totalTradingValue': totalTradingValue,
      'time': time,
      'basicPrice': refercencePrice,
      'ceilingPrice': ceilingPrice,
      'floorPrice': floorPrice,
      'tradingVolumn': tradingVolumn,
      'tradingValue': tradingValue,
      'currentPrice': currentPrice,
      'changeValue': changeValue,
      'changRatio': changRatio,
      'cap': cap,
      'fbv': fbv,
      'fba': fba,
      'fsv': fsv,
      'fsa': fsa,
      'bpb1': bpb1,
      'bvb1': bvb1,
      'apb1': apb1,
      'avb1': avb1,
      'bpb2': bpb2,
      'bvb2': bvb2,
      'apb2': apb2,
      'avb2': avb2,
      'bpb3': bpb3,
      'bvb3': bvb3,
      'apb3': apb3,
      'avb3': avb3,
      'matchPrice': matchPrice,
      'matchQtty': matchQtty,
      'totalVolume': totalVolume,
      'buyForeignQtty': buyForeignQtty,
      'sellForeignQtty': sellForeignQtty,
      'remainForeignQtty': remainForeignQtty,
    };
  }

  factory StockModel.fromMap(Map<String, dynamic> map) {
    return StockModel(
      market:
          EnumHelper.enumFromString(MARKET.values, map['c0']) ?? MARKET.NONE,
      stockCode: map['c1'],
      stockName: map['c2'],
      stockType: EnumHelper.enumFromString(STOCK_TYPE.values, map['c3']) ??
          STOCK_TYPE.values.first,
    );
  }

  Color getColor(num value) {
    if (value > 0 && value > floorPrice && value < refercencePrice) {
      return AppColors.red;
    } else if (value > 0 && value < ceilingPrice && value > refercencePrice) {
      return AppColors.green;
    } else if (value == 0 || value == refercencePrice) {
      return AppColors.yellow;
    } else if (value > 0 && value == ceilingPrice) {
      return AppColors.purple;
    } else if (value > 0 && value == floorPrice) {
      return AppColors.teal;
    }
    return AppColors.yellow;
  }

  bool get isCW => stockType == STOCK_TYPE.CW;
}
