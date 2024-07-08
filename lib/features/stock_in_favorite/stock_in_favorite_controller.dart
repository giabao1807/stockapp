// import 'package:get/get.dart';
// import 'package:mtsv4/model/selectable_item.dart';
// import 'package:mtsv4/presentation/global_controller.dart';
// import 'package:mtsv4/repository/market_repo.dart';

// class StockInFavoriteController extends GetxController {
//   final SelectableItem model;

//   late final _screen = 'STOCK_BY_FAVORITE_$model';

//   StockInFavoriteController() {
    
//     stocks = getRxFavoriteList(model);

//     _g.subscribe(['MDDS|SI'], stocks.value.map((e) => e).toList(), _screen);
//     _g.subscribe(
//       [DateTime.now().hour >= 13 ? 'INTRADAY_5m' : 'INTRADAY_1m'],
//       stocks.value.map((e) => e).toList(),
//       _screen,
//     );
//     _repo = MarketRepo();
//   }

//   late final MarketRepo _repo;

//   final GlobalService _g = Get.find();

//   late Rx<List<String>> stocks;

//   final RxString sortColumn = RxString('');

//   // final _watchList = Get.find<WatchListController>();

//   List<String> sortedList = [];

//   // sortByStockCode(SortType type) {
//   //   sortColumn('S');
//   //   if (type == SortType.idle || type == SortType.up) {
//   //     stocks.update((val) {
//   //       val?.sort((a, b) => a.compareTo(b));
//   //     });
//   //   } else if (type == SortType.down) {
//   //     stocks.update((val) {
//   //       val?.sort((a, b) => b.compareTo(a));
//   //     });
//   //   }
//   // }

//   // sortByRatioChange(SortType type) {
//   //   sortColumn('C');
//   //   final list = stocks.value.map((e) => _g.stocks[e]).toList();
//   //   if (type == SortType.idle || type == SortType.up) {
//   //     list.sort((a, b) =>
//   //         a?.value.ratioChange.compareTo(b?.value.ratioChange ?? 0) ?? 0);
//   //   } else {
//   //     list.sort((b, a) =>
//   //         a?.value.ratioChange.compareTo(b?.value.ratioChange ?? 0) ?? 0);
//   //   }
//   //   stocks.update((val) {
//   //     val
//   //       ?..clear()
//   //       ..addAll(list.map((e) => e?.value.stockCode ?? ''));
//   //   });
//   // }

//   // onAddStockButtonPressed() {
//   //   Get.to(
//   //     () => SearchStockScreen(
//   //       stocks: stocks.value,
//   //       onButtonAddPressed: (stockCode) {
//   //         Get.back();
//   //         _watchList.addStockToFavoriteList(model, stockCode);
//   //         _g.subscribe(['MDDS|SI'], [stockCode], _screen);
//   //       },
//   //     ),
//   //   );
//   // }

//   // delete(String stockCode) {
//   //   _repo.removeStockInFavorite(favoriteId: model.id, stockCode: stockCode);
//   //   stocks.update((val) {
//   //     val?.remove(stockCode);
//   //   });
//   // }

//   // onOrderButtonPressed() {
//   //   Get.to(
//   //     () => SortWatchListScreen(
//   //       items: stocks.value.map((e) => e).toList(),
//   //       onButtonSavePressed: (items) {
//   //         stocks.update((val) {
//   //           val?.clear();
//   //           val?.addAll(items);
//   //           Get.back();
//   //           _watchList.saveFavoriteData(key: model.id, value: items);
//   //         });
//   //       },
//   //     ),
//   //   );
//   // }

//   Rx<List<String>> getRxFavoriteList(SelectableItem value) {
//     final result = _g.favoriteData[value] ??= Rx([]);
//     return result;
//   }

//   @override
//   void onClose() {
//     _g.unsubscribe(['MDDS|SI'], stocks.value);
//     _g.unsubscribe([DateTime.now().hour >= 13 ? 'INTRADAY_5m' : 'INTRADAY_1m'],
//         stocks.value.map((data) => data).toList());
//     _repo.dispose();
//     super.onClose();
//   }
// }
