import 'dart:async';
import 'package:get/get.dart';
import 'package:mtsv4/model/selectable_item.dart';
import 'package:mtsv4/model/stock_model.dart';
import 'package:mtsv4/repository/market_repo.dart';

class GlobalService extends GetxController {
  Map<String, List<String>> get subscribing => _marketRepo.subscribing;

  RxBool hasConnection = RxBool(true);

  final RxInt curentIndex = RxInt(0);

  late final MarketRepo _marketRepo;
  Map<String, Map<String, List<String>>> subscribed = {};
  // late final Map<String, Rx<StockMode>> stocks = _repo.stocks;

  RxString currentExchange = RxString('HSX');

  final Map<SelectableItem, Rx<List<String>>> favoriteData = {};

  late final Map<String, Rx<StockModel>> stocks = {};

  @override
  void onInit() {
    _marketRepo = MarketRepo();
    hasConnection.listen((value) {
      if (value) {
        final topics = subscribing.keys.toList();
        for (var item in topics) {
          final values = subscribing[item];
          if (values != null && values.isNotEmpty) {
            _marketRepo.subscribe([item], values);
          }
        }
      }
    });
    super.onInit();
  }

  subscribe(List<String> topics, List<String> values, String screen) {
    if (values.isEmpty || topics.isEmpty) return;
    for (var stock in values) {
      Map<String, List<String>> value = subscribed[stock] ??= {};
      for (var topic in topics) {
        List<String> screens = value[topic] ??= [];
        screens.add(screen);
      }
    }
    _marketRepo.subscribe(topics, values);
  }

  _onReceivedPriceData(Map<String, dynamic> json) {
    final type = json['U7'];
    if (type == 'SI') {
      final stockCode = json['t55'];
      final num matchPrice = json['t31'];
      final num basicPrice = json['t260'];
      // final DateTime tradingDate = TimeUtils.covertDateTime(json['t388']);
      // final item = stocks[stockCode];
      // if (item != null) {
      //   final change = matchPrice - basicPrice;
      //   final ratioChange = (change / basicPrice) * 100;
      //   final ceilingPrice = json['t332'];
      //   final floorPrice = json['t333'];

      //   item.update((val) {
      //     val?.refercencePrice = basicPrice;
      //     val?.ceilingPrice = ceilingPrice;
      //     val?.floorPrice = floorPrice;
      //     val?.matchPrice = matchPrice;
      //     val?.matchQtty = json['t32'];
      //     val?.totalVolume = json['t387'];
      //     val?.sellForeignQtty = json['t398'];
      //     val?.buyForeignQtty = json['t397'];
      //     val?.remainForeignQtty = json['t3301'];
      //     val?.highestPrice = json['t266'];
      //     val?.lowestPrice = json['t2661'];
      //     val?.openPrice = json['t137'];
      //     val?.closePrice = json['t139'] ?? 0;
      //     val?.currentPrice = json['t255'];
      //     val?.u35 = json['U35'] ?? 0;
      //     val?.u36 = json['U36'] ?? 0;
      //     val?.tradingDate = tradingDate;

      //     if (matchPrice != 0) {
      //       val?.value = matchPrice;
      //       val?.change = change;
      //       val?.ratioChange = ratioChange;
      //     } else {
      //       val?.value = basicPrice;
      //       val?.change = 0;
      //       val?.ratioChange = 0;
      //     }
      //   });
      //   if (_auth.hasLogin.value) {
      //     _calcultateProfiteLossOfUser(json['t55']);
      //   }
      // }
    }

    if (type == 'TP' || type == 'PO' || type == 'TO') {
      final stockCode = json['t55'];
      // final item = stocks[stockCode];
      // final List data = json[type] ?? [];
      // if (item != null) {
      //   item.update((val) {
      //     if (data.length < 3) return;
      //     val?.bpb1 = data[0]['t132'];
      //     val?.bvb1 = data[0]['t1321'];
      //     val?.apb1 = data[0]['t133'];
      //     val?.avb1 = data[0]['t1331'];
      //     val?.bpb2 = data[1]['t132'];
      //     val?.bvb2 = data[1]['t1321'];
      //     val?.apb2 = data[1]['t133'];
      //     val?.avb2 = data[1]['t1331'];
      //     val?.bpb3 = data[2]['t132'];
      //     val?.bvb3 = data[2]['t1321'];
      //     val?.apb3 = data[2]['t133'];
      //     val?.avb3 = data[2]['t1331'];
      //   });
      // }
    }
  }

  _subcribeStocksUserOwn() {
    // subscribe(
    //     ['MDDS|SI'],
    //     List.from(
    //       realAccHoldingStocks.value.map((e) => e.stockCode).toSet(),
    //     ),
    //     'GLOBAL_CONTROLLER');
  }

  _unSubcribeStocksUserOwn() {
    // unsubscribe(
    //   ['MDDS|SI'],
    //   List.from(
    //     realAccHoldingStocks.value.map((e) => e.stockCode).toSet(),
    //   ),
    // );
  }

  unsubscribe(List<String> topics, List<String> values) {
    if (values.isEmpty || topics.isEmpty) return;
    for (var stock in values) {
      Map<String, List<String>>? value = subscribed[stock];
      if (value == null) return;
      for (var topic in topics) {
        List<String>? screens = value[topic];
        if (screens == null || screens.isEmpty) return;
        screens.clear();
      }
    }
    _marketRepo.unsubscribe(topics, values);
  }

  StockModel getData(String data) {
    if (stocks[data] == null) {
      stocks[data] = Rx(
        StockModel.init(data),
      );
    }
    return stocks[data]!.value;
  }

  @override
  void onClose() {
    _unSubcribeStocksUserOwn();
    _marketRepo.dispose();
    super.onClose();
  }
}
