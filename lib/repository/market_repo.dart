import 'dart:async';
import 'dart:convert';

import 'package:mtsv4/global/socket/fos_client.dart';
import 'package:mtsv4/global/socket/market_stream_client.dart';
import 'package:mtsv4/model/stock_top_model.dart';
import 'package:mtsv4/utils/enum/market_type.dart';

// import 'package:finalpha/core/net/socket/fos_client.dart';
// import 'package:finalpha/core/net/socket/market_stream_client.dart';
// import 'package:finalpha/model/balance_sheet_model.dart';
// import 'package:finalpha/model/cash_flow_model.dart';
// import 'package:finalpha/model/event_data.dart';
// import 'package:finalpha/model/history_price_model.dart';
// import 'package:finalpha/model/income_revenue_model.dart';
// import 'package:finalpha/model/index_model.dart';
// import 'package:finalpha/model/news_model.dart';
// import 'package:finalpha/model/profile_model.dart';
// import 'package:finalpha/model/stock_top_model.dart';
// import 'package:finalpha/repository/auth_repo.dart';
// import 'package:finalpha/utils/enum/market_type.dart';
// import 'package:finalpha/utils/enum/time_utils.dart';
// import 'package:finalpha/utils/string/string_utils.dart';
// import 'package:finalpha/utils/ui/app_snackbar.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:k_chart/entity/k_line_entity.dart';

class MarketRepo {
  final String TAG = 'MarketRepo';
  final FosClient _client;
  final MarketStreamClient _streamClient;
  Map<String, List<String>> get subscribing => _streamClient.subscribing;
  late final StreamSubscription _listenDataChanged;
  final Function(Map<String, dynamic> json)? onReceivedTopTradingTodayData;

  MarketRepo({
    this.onReceivedTopTradingTodayData,
    this.onReceivedTopTradingByTimeData,
  })  : _client = FosClient(),
        _streamClient = MarketStreamClient() {
    _listenDataChanged = _streamClient.streamController.stream.listen(
      (event) {
        if ((event['topic'] as String?)?.startsWith('TOP') ?? false) {
          onReceivedTopTradingTodayData?.call(event['data']);
        } else {}
      },
    );
  }

  final Function(List<StockTopModel> data)? onReceivedTopTradingByTimeData;

  Function(List<String> topics, List<String> values) get subscribe =>
      _streamClient.subscribe;

  Function(List<String> topics, List<String> values) get unsubscribe =>
      _streamClient.unsubscribe;

  // Future getIndexList() async {
  //   final result = await _client.sendRequest(
  //     workerName: 'FOSqMkt02',
  //     serviceName: 'FOSqMkt02_IndexMgt',
  //     operation: 'Q',
  //     inputParams: [
  //       'idx_list',
  //       '%',
  //     ],
  //     headers: AuthRepo.headers,
  //     actToken: AuthRepo.accessToken,
  //   );
  //   if (result.result) {
  //     onReceivedIndexList?.call(
  //       result.items.map((e) => IndexModel.fromJson(e)).toList(),
  //     );
  //   }
  // }

  // Function(String topics, String values) get history => _streamClient.history;

  // Function(List<String> topics, List<String> values) get subscribe =>
  //     _streamClient.subscribe;

  // Function(List<String> topics, List<String> values) get unsubscribe =>
  //     _streamClient.unsubscribe;

  // Future getStockByIndex({required String indexCode}) async {
  //   final result = await _client.sendRequest(
  //     workerName: 'FOSqMkt02',
  //     serviceName: 'FOSqMkt02_IndexMgt',
  //     operation: 'Q',
  //     inputParams: [
  //       'stk_list',
  //       indexCode,
  //     ],
  //     headers: AuthRepo.headers,
  //     actToken: AuthRepo.accessToken,
  //   );
  //   final data = List<String>.from(
  //     result.items.map(
  //       (e) => e['c0'],
  //     ),
  //   );
  //   onReceivedStocksByIndexData?.call(data);
  // }

  // removeStockInFavorite(
  //     {required String favoriteId, required String stockCode}) {
  //   _client.sendRequest(
  //     workerName: 'FOSxID01',
  //     serviceName: 'FOSxID01_FavoritesMgt',
  //     operation: 'Q',
  //     inputParams: [
  //       'FAV_ITEM_REMOVE',
  //       favoriteId,
  //       stockCode,
  //     ],
  //     headers: AuthRepo.headers,
  //     actToken: AuthRepo.accessToken,
  //   );
  // }

  Future getTopData({
    required MARKET marketType,
    required String time,
    required String topType,
  }) async {
    final result = await _client.sendRequest(
        workerName: 'FOSqMkt02',
        serviceName: 'FOSqMkt02_MktInfo',
        operation: 'Q',
        inputParams: [
          '1',
          marketType.market,
          time,
          topType,
          '-1',
        ]);
    final data = List<StockTopModel>.from(
      result.items.map(
        (e) => StockTopModel.fromTopTradingByTimeJson(e),
      ),
    );
    print('${TAG} getTopData result ${result}');
    onReceivedTopTradingByTimeData?.call(data);
  }

  dispose() {
    _listenDataChanged.cancel();
  }
}
