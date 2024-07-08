import 'package:mtsv4/global/socket/fos_client.dart';
import 'package:mtsv4/model/account_asset_model.dart';
import 'package:mtsv4/model/holding_stock_model.dart';
import 'package:mtsv4/repository/auth_repo.dart';
import 'package:mtsv4/repository/lending_margin_model.dart';

class AssetRepo {
  final FosClient _client;

  AssetRepo() : _client = FosClient();

  Future<List<HoldingStockModel>> getAssetByStock(List<String> params) async {
    final result = await _client.sendRequest(
        workerName: 'FOSqAsset',
        serviceName: 'FOSqAsset_1801_1',
        operation: 'Q',
        headers: AuthRepo.headers,
        inputParams: params);
    if (result.hasError == false) {
      return result.items.map((e) => HoldingStockModel.fromJson(e)).toList();
    } else {
      throw result.messages;
    }
  }

  Future<AccountAssetModel> getAccountAsset(List<String> params) async {
    try {
      final res = await _client.sendRequest(
          workerName: 'FOSqAsset',
          serviceName: 'FOSqAsset_1801_1',
          operation: 'Q',
          headers: AuthRepo.headers,
          inputParams: params);
      if (res.hasError == false && res.items.isNotEmpty) {
        return AccountAssetModel.fromJson(res.items.first);
      } else {
        throw res.messages;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<LendingMarginModel> getLendingMargin(List<String> params) async {
    final result = await _client.sendRequest(
        workerName: 'FOSqMargin',
        serviceName: 'FOSqLendingMargin_Online_1450_2',
        operation: 'Q',
        headers: AuthRepo.headers,
        inputParams: params);
    if (result.hasError == false) {
      return LendingMarginModel.fromMap(result.items.first);
    } else {
      throw result.messages;
    }
  }
}
