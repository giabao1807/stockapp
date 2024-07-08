import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtsv4/global/global_sv.dart';
import 'package:mtsv4/model/index_model.dart';
import 'package:mtsv4/presentation/global_controller.dart';
import 'package:mtsv4/repository/market_repo.dart';

String _screen = 'MARKET';

class MarketController extends GetxController {
  MarketController(this.context);

  @override
  void onInit() {
    _mRepo = MarketRepo(
        // onReceivedIndexList: _onReceivedIndexList,
        // onReceivedPriceData: _onReceivedStreamData,
        );

    // _mRepo.getIndexList();
    // _g.getCash();
    // if (displayedShowcase == false) {
    //   streamSubIsShowFos = _a.isShowingFos.listen((value) {
    //     if (value == false) startShowCase();
    //   });
    // } else {
    streamSubIsShowFos = null;
    // }
    super.onInit();
  }

  final BuildContext context;

  final List<GlobalKey> keys = List.generate(5, (index) => GlobalKey());

  // final AuthService _auth = Get.find();

  // Rx<LoginModel?> get loginModel => _auth.loginModel;

  late final MarketRepo _mRepo;

  Rx<List<String>> indexsCode = Rx([]);

  final Map<String, Rx<IndexModel>> indexs = {};

  final Rx<String?> selectedIndex = Rx(null);

  // Rx<CashUserModel> get cashUser => _auth.cashUser;

  // final _g = Get.find<GlobalService>();

  // final _a = Get.find<AuthService>();

  late final StreamSubscription<bool>? streamSubIsShowFos;

  // bool displayedShowcase =
  //     SpUtil.getBool('displayed_showcase_market_screen', defValue: false)!;

  // final watchList = Get.put(WatchListController());

  // startShowCase() {
  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (_) {
  //       if (displayedShowcase == false) {
  //         final tabs = watchList.tabs.value;
  //         final indexOfTabVN30 =
  //             tabs.indexOf(SelectableItem(id: 'VN30', name: 'VN30'));
  //         if (indexOfTabVN30 != -1 &&
  //             indexOfTabVN30 != watchList.currentIndex.value) {
  //           watchList.tabController.animateTo(indexOfTabVN30);
  //         }
  //         ShowCaseWidget.of(context).startShowCase(keys);
  //         displayedShowcase = true;
  //         SpUtil.putBool('displayed_showcase_market_screen', displayedShowcase);
  //       }
  //     },
  //   );
  // }

  // IndexModel getIndex(String indexCode) {
  //   final index = indexs[indexCode] ??= Rx(
  //     IndexModel.init(indexCode),
  //   );
  //   return index.value;
  // }

  // _onReceivedIndexList(List<IndexModel> data) {
  //   indexsCode.update((val) {
  //     val?.addAll(data.map((e) => e.indexCode).toList());
  //   });
  //   selectedIndex(indexsCode.value.first);
  //   for (var e in data) {
  //     indexs[e.indexCode] = Rx(e);
  //   }
  //   _g.subscribe(['MDDS|I'], data.map((e) => e.indexCode).toList(), _screen);
  //   // startShowCase(context);
  // }

  // _onReceivedStreamData(Map<String, dynamic> json) {
  //   if (json['U7'] != 'I') return;

  //   final indexCode = json['t2'];
  //   final indexValue = json['t3'];
  //   final change = json['t5'];
  //   final ratioChange = json['t6'];
  //   final open = json['U27'];
  //   final rangeStart = json['t25'];
  //   final rangeEnd = json['t24'];
  //   final volume = json['t7'];
  //   final value = json['t3'];
  //   final item = indexs[indexCode];
  //   //For unknown reasons, there is a case of null when debugging
  //   final worth = json['t14'] ?? 0;
  //   if (item != null) {
  //     item.update(
  //       (val) {
  //         val?.indexValue = indexValue;
  //         val?.changeAmount = change;
  //         val?.changeRatio = ratioChange;
  //         val?.open = open;
  //         val?.rangeStart = rangeStart;
  //         val?.rangeEnd = rangeEnd;
  //         val?.volume = volume;
  //         val?.value = value;
  //         val?.worth = worth;
  //       },
  //     );
  //   }
  // }

  IndexModel getIndex(String indexCode) {
    final index = indexs[indexCode] ??= Rx(
      IndexModel.init(indexCode),
    );
    return index.value;
  }

  @override
  void onClose() {
    // Get.delete<WatchListController>();
    // _g.unsubscribe(['MDDS|I'], indexsCode.value);
    streamSubIsShowFos?.cancel();
    super.onClose();
  }
}
