import 'package:get/get.dart';
import 'package:mtsv4/model/stock_top_model.dart';
import 'package:mtsv4/presentation/global_controller.dart';
import 'package:mtsv4/repository/market_repo.dart';
import 'package:mtsv4/utils/enum/market_type.dart';
import 'package:mtsv4/widgets/grid_data/grid_data.dart';

enum TopType { TV, TA, TU, TD }

enum TimeQuery { TODAY, WEEK, MONTH, SIX_MONTHS, YEAR }

extension TimeQueryExt on TimeQuery {
  static const _name = {
    TimeQuery.TODAY: 'today',
    TimeQuery.WEEK: '5_days',
    TimeQuery.MONTH: '1_month',
    TimeQuery.SIX_MONTHS: '6_months',
    TimeQuery.YEAR: '1_year',
  };
  static const _types = {
    TimeQuery.TODAY: '',
    TimeQuery.WEEK: '1W',
    TimeQuery.MONTH: '1M',
    TimeQuery.SIX_MONTHS: '6M',
    TimeQuery.YEAR: '1Y',
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

const _screen = 'TOP_TRADING';

class TopTradingController extends GetxController
    with StateMixin<List<StockTopModel>> {
  TopTradingController() {
    _repo = MarketRepo(
      onReceivedTopTradingTodayData: _onReceivedTopData,
      onReceivedTopTradingByTimeData: _onReceivedTopTradingByTimeData,
    );
    change([], status: RxStatus.success());
    _g.subscribe([selectedTopType.value.type], [market.code], _screen);
    _g.currentExchange.listen((value) {
      final newMarket =
          MARKET.values.firstWhereOrNull((item) => item.name == value);
      if (newMarket == null) return;
      if (market == newMarket) return;
      market = newMarket;
      change([], status: RxStatus.success());
      if (timeQuery.value == TimeQuery.TODAY) {
        _g.unsubscribe(
          [selectedTopType.value.type],
          [market.code],
        );
        _g.subscribe([selectedTopType.value.type], [market.code], _screen);
      } else {
        _repo.getTopData(
          marketType: market,
          time: timeQuery.value.type,
          topType: selectedTopType.value.name,
        );
      }
    });
  }

  final _g = Get.find<GlobalService>();

  late final MarketRepo _repo;

  final GridDataController gridDataController = GridDataController();

  late MARKET market = MARKET.HSX;

  final Rx<TopType> selectedTopType = Rx(TopType.values.first);

  final Rx<TimeQuery> timeQuery = Rx(TimeQuery.values.first);

  final RxString sortField = RxString('');

  onChangeTopTrading(TopType value) {
    change([], status: RxStatus.success());
    selectedTopType(value);
    if (timeQuery.value == TimeQuery.TODAY) {
      _g.unsubscribe(
        [selectedTopType.value.type],
        [market.code],
      );
      _g.subscribe([selectedTopType.value.type], [market.code], _screen);
    } else {
      _repo.getTopData(
        marketType: market,
        time: timeQuery.value.type,
        topType: selectedTopType.value.name,
      );
    }
  }

  onChangeTimeQuerry(int index) {
    final result = TimeQuery.values[index];
    if (result == timeQuery.value) return;
    change([], status: RxStatus.success());
    if (result == TimeQuery.TODAY) {
      _repo.subscribe([selectedTopType.value.type], [market.code]);
    } else {
      if (timeQuery.value == TimeQuery.TODAY) {
        _repo.unsubscribe([selectedTopType.value.type], [market.code]);
      }
      _repo.getTopData(
        marketType: market,
        time: result.type,
        topType: selectedTopType.value.name,
      );
    }
    timeQuery(result);
    // _repo.getTopData(marketType: selectedTopType., time: time);
  }

  _onReceivedTopData(Map<String, dynamic> json) {
    final List items = json['ITEMS'];
    if (items.isEmpty) return;

    final List<StockTopModel> newList = [];
    for (var e in items) {
      final result = StockTopModel.fromMap(e);
      newList.add(result);
    }

    change(newList, status: RxStatus.success());

    if (sortField.value != '') {
      sort(sortField.value, showChangeDirection: false);
    }
  }

  _onReceivedTopTradingByTimeData(List<StockTopModel> data) {
    change(data, status: RxStatus.success());
    if (sortField.value != '') {
      sort(sortField.value, showChangeDirection: false);
    }
  }

  sort(String column, {bool showChangeDirection = true}) {
    // if (showChangeDirection) {
    //   if (direction.value == SortType.idle ||
    //       direction.value == SortType.down) {
    //     direction.value = SortType.up;
    //   } else if (direction.value == SortType.up) {
    //     direction.value = SortType.down;
    //   }
    // }

    // if (direction.value != SortType.idle) {
    //   final newList = SortUtils.sortColumn<StockTopModel>(
    //     sortColumn: column,
    //     direction: direction.value,
    //     data: state?.map((e) => e.toMap()).toList() ?? [],
    //     returnObj: StockTopModel.fromMap,
    //     isSortString: column == 'S',
    //   );
    //   change(newList, status: RxStatus.success());
    // }
    // sortField.value = column;
  }

  @override
  void onClose() {
    if (timeQuery.value == TimeQuery.TODAY) {
      _repo.unsubscribe([selectedTopType.value.type], [market.code]);
    }
    _repo.dispose();
    super.onClose();
  }
}
