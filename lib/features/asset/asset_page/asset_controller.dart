import 'dart:async';
import 'package:get/get.dart';
import 'package:mtsv4/model/account_asset_model.dart';
import 'package:mtsv4/model/holding_stock_model.dart';
import 'package:mtsv4/model/login_model.dart';
import 'package:mtsv4/presentation/auth_controller.dart';
import 'package:mtsv4/presentation/global_controller.dart';
import 'package:mtsv4/repository/asset_repo.dart';
import '../../../../repository/market_repo.dart';
import '../../../../resource/app_colors.dart';

String _screen = 'MY_ASSET_SCREEN';

class AssetController extends GetxController {
  AssetController() : _repo = AssetRepo() {
    _loadAssetByStock();
    _loadAccountAsset();

    listenSelectedAccountChange = auth.selectedAccount.listen(
      (value) {
        if (value != null) {
          _unsubscribe();
          _loadAssetByStock(500);
          _loadAccountAsset(500);
        }
      },
    );
    marketRepo = MarketRepo(
        // onReceivedPriceData: (json) {
        //   final type = json['U7'];
        //   if (type == 'SI') {
        //     if (isVts) {
        //     } else {
        //       holdingStocks.update(
        //         (val) {
        //           final item =
        //               val?.firstWhereOrNull((e) => e.stockCode == json['t55']);
        //           if (item != null) {
        //             _reCalcData(item);
        //             profitLoss.value = _calcProfitLoss(
        //               holdingStocks.value
        //                   .map(
        //                     (e) => e.profitloss,
        //                   )
        //                   .toList(),
        //             );
        //             profitLossRate.value = _calcProfitLossRate(
        //               holdingStocks.value
        //                   .map(
        //                     (e) => e.avgValue,
        //                   )
        //                   .toList(),
        //             );
        //           }
        //         },
        //       );
        //     }
        //   }
        // },
        );
  }

  final auth = Get.find<AuthService>();

  final _g = Get.find<GlobalService>();
  GlobalService get g => _g;

  late StreamSubscription<AccountResponse?> listenSelectedAccountChange;

  Rx<AccountResponse?> get selectedAccount => auth.selectedAccount;

  Rx<LoginModel?> get loginModel => auth.loginModel;

  final AssetRepo _repo;

  final Rx<List<HoldingStockModel>> holdingStocks = Rx([]);

  final List<String> _stockCodes = [];

  final Rx<AccountAssetModel?> accountAsset = Rx(null);

  final profitLossRate = RxNum(0);

  final profitLoss = RxNum(0);

  final vtsCashAmount = RxNum(0);

  final vtsLoanAmount = RxNum(0);

  final stockAmount = RxNum(0);

  late final MarketRepo marketRepo;

  bool get isVts => auth.isVts.value;

  final RxBool showMore = RxBool(false);
  final RxBool showingColumn = RxBool(false);

  onRefresh() async {
    await Future.value(
      [
        _loadAssetByStock(),
        _loadAccountAsset(),
      ],
    );
  }

  _loadAssetByStock([int timeout = 0]) {
    holdingStocks.update((val) {
      val?.clear();
    });
    stockAmount(0);
    Future.delayed(
      Duration(milliseconds: timeout),
      () {
        if (auth.selectedAccount.value == null) return;
        _repo.getAssetByStock(
          [
            '02',
            auth.selectedAccount.value?.accountNumber ?? '',
            auth.selectedAccount.value?.subNumber ?? '',
          ],
        ).then(
          (value) {
            if (value.isEmpty) {
              return;
            }

            for (var item in value) {
              _reCalcData(item);
            }

            profitLoss.value = _calcProfitLoss(
              value
                  .map(
                    (e) => e.profitloss,
                  )
                  .toList(),
            );
            profitLossRate.value = _calcProfitLossRate(
              value
                  .map(
                    (e) => e.avgValue,
                  )
                  .toList(),
            );

            holdingStocks.update(
              (val) {
                val?.addAll(value);
              },
            );
            _stockCodes.addAll(
              List.from(
                value.map((e) => e.stockCode).toSet(),
              ),
            );

            // _stockCodes.removeWhere(
            //   (e) => _g
            //       .getScreensSubscribed(
            //         'MDDS|SI',
            //         e,
            //       )
            //       .isNotEmpty,
            // );

            _subscribe();
          },
        );
      },
    );
  }

  _reCalcData(HoldingStockModel item) {
    // final s = _g.getData(item.stockCode);
    // //!Không áp dụng công thức tính theo tài liệu cấp.
    // if (s.matchPrice != 0) item.currentPrice = s.matchPrice;
    // item.currentValue = item.currentPrice * item.total;
    // item.avgValue = item.avgPrice * item.total;
    // item.profitloss = item.currentValue - item.avgValue;
    // item.profitlossRate = item.avgValue == 0
    //     ? 0
    //     : double.parse(
    //         (100 * ((item.currentValue - item.avgValue) / item.avgValue))
    //             .toStringAsFixed(2));
  }

  _loadAccountAsset([int timeout = 0]) {
    vtsCashAmount(0);
    vtsLoanAmount(0);

    accountAsset.value = null;
    Future.delayed(
      Duration(milliseconds: timeout),
      () {
        _repo.getAccountAsset(
          [
            '01',
            auth.selectedAccount.value?.accountNumber ?? '',
            auth.selectedAccount.value?.subNumber ?? '',
          ],
        ).then((value) {
          accountAsset(value);
        }, onError: (e) {
          accountAsset.value = null;
        });
      },
    );
  }

  _subscribe() {
    // _g.subscribe(['MDDS|SI'], _stockCodes, _screen);
  }

  _unsubscribe() {
    _g.unsubscribe(['MDDS|SI'], _stockCodes);
    _stockCodes.clear();
    profitLoss(0);
    profitLossRate(0);
  }

  num _calcProfitLossRate(List<num> data) {
    final avgBuyValues = data.reduce((a, b) => a + b);
    return avgBuyValues == 0
        ? 0
        : (((profitLoss.value / avgBuyValues) * 10000) / 100);
  }

  num _calcProfitLoss(List<num> data) {
    return data.reduce((a, b) => a + b);
  }


  updateDataWhenHavestreamData() {
    // stockAmount.value = _calcVtsStockAmmount();
    // _calcVtsProfitLossData();
  }

  @override
  void onClose() {
    listenSelectedAccountChange.cancel();
    _unsubscribe();
    super.onClose();
  }
}
