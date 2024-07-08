import 'dart:async';

import 'package:get/get.dart';
import 'package:mtsv4/global/socket/market_stream_client.dart';
import 'package:mtsv4/model/stock_top_model.dart';
import 'package:mtsv4/repository/market_repo.dart';
import 'package:mtsv4/utils/enum/market_type.dart';

enum TopType { TV, TA, TU, TD }

enum TimeQuery { TODAY, WEEK, MONTH, SIX_MONTHS, YEAR }

extension TimeQueryExt on TimeQuery {
  static const _name = {
    TimeQuery.TODAY: 'today',
  };
  static const _types = {
    TimeQuery.TODAY: '',
  };

  String get display => _name[this]?.tr ?? '';
  String get type => _types[this] ?? '';
}

extension TopTypeExt on TopType {
  static const _name = {
    TopType.TA: 'top_value',
    TopType.TV: 'top_volume',
    TopType.TU: 'top_gainers',
    TopType.TD: 'top_lossers',
  };
  static const _type = {
    TopType.TA: 'TOP_VAL_UP',
    TopType.TV: 'TOP_QTY_UP',
    TopType.TU: 'TOP_PRI_UP',
    TopType.TD: 'TOP_PRI_DOWN',
  };
  String get display => _name[this]?.tr ?? '';
  String get type => _type[this] ?? '';
}

const TAG = 'TOP_TRADING_CONTROLLER';

final topStockList = <StockTopModel>[].obs;
late final MarketStreamClient _streamClient;
late final StreamSubscription _listenDataChanged;
Map<String, List<String>> get subscribing => _streamClient.subscribing;

class TopTradingController extends GetxController
    with StateMixin<List<StockTopModel>> {
  TopTradingController() {
    print('${TAG} init');
    // _streamClient = MarketStreamClient('fsdfsdf') {};
    // change([], status: RxStatus.success());
  }

  late MARKET market = MARKET.HSX;

  // final Rx<TopType> selectedTopType = Rx(TopType.values.first);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _streamClient = MarketStreamClient();
    // _listenDataChanged = _streamClient.streamController.stream.listen(
    //   (event) {
    //     if (event['his_res'] != null) {
    //     } else {
    //       if ((event['topic'] as String?)?.startsWith('MDDS|EP') ?? false) {}
    //       if ((event['topic'] as String?)?.startsWith('MDDS|BI') ?? false) {}
    //       if ((event['topic'] as String?)?.startsWith('TOP') ?? false) {
    //         // onReceivedTopTradingTodayData?.call(event['data']);
    //       } else {}
    //       if ((event['topic'] as String?)?.startsWith('MDDS') ?? false) {}
    //       if ((event['topic'] as String?)?.startsWith('MDDS|I') ?? false) {}
    //     }
    //   },
    // );
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
