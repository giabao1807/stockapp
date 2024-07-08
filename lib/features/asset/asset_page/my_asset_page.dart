import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mtsv4/features/asset/asset_page/asset_controller.dart';
import 'package:mtsv4/features/asset/asset_page/hoding_stock_item.dart';
import 'package:mtsv4/resource/app_padding.dart';
import 'package:mtsv4/utils/extension/num_extension.dart';

import '../../../../resource/resource.dart';
import '../../../widgets/fill_button.dart';

class AssetPage extends StatelessWidget {
  const AssetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssetController>(
      init: AssetController(),
      builder: (controller) => SingleChildScrollView(
        padding: AppPad.horiz16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Gaps.vGap8,
                _buildHoldingStocksWidget(controller),
                Gaps.vGap8,
                _buildAccountAssetWidget(controller),
                Gaps.vGap16,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Obx _buildAccountAssetWidget(AssetController controller) {
    return Obx(
      () {
        final asset = controller.accountAsset.value;
        if (asset == null) return Gaps.empty;
        final totalAsset = asset.c23;
        num totalCashAsset = 0;
        num netAsset = 0;
        if (totalAsset > 0) {
          totalCashAsset = (((asset.c39 / totalAsset) * 10000) / 100);
          netAsset = (((asset.c24 / totalAsset) * 10000) / 100);
        }
        num stock = 0;
        if (controller.holdingStocks.value.isNotEmpty) {
          stock = controller.holdingStocks.value.fold(
            0,
            (previousValue, e) => previousValue + e.currentPrice * e.total,
          );
        }
        print('assest.c2 ${asset.c2}');

        List<_AssetDataViewModel> data = [
          _AssetDataViewModel(
            percent: totalCashAsset,
            color: AppColors.teal,
            value: asset.c2,
            title: 'cash'.tr,
          ),
          _AssetDataViewModel(
            percent: totalAsset == 0 ? 0 : 100 - totalCashAsset,
            color: AppColors.selectiveYellow,
            value: stock,
            title: 'stock'.tr,
          ),
          _AssetDataViewModel(
            percent: totalAsset == 0 ? 0 : 100,
            color: AppColors.electricViolet,
            value: totalAsset,
            title: 'assets'.tr,
          ),
          _AssetDataViewModel(
            percent: totalAsset == 0 ? 0 : 100 - netAsset,
            color: AppColors.yellowGreen,
            value: asset.c37 + asset.c13 + asset.c15 + asset.c17,
            title: 'total_dept'.tr,
          ),
          _AssetDataViewModel(
            percent: netAsset,
            color: AppColors.mangoTango,
            value: asset.c24,
            title: 'net_assets'.tr,
          ),
        ];
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.white.withOpacity(0.31),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 40,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                    color: Colors.black.withOpacity(0.08),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = data[index];
                      return InkWell(
                        onTap: item.onPressed,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Container(
                                height: 24,
                                width: 8,
                                decoration: BoxDecoration(
                                  color: item.color,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              Gaps.hGap16,
                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textTitle,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                item.value.format,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Gaps.line,
                    itemCount: data.length,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Obx _buildVtsAccountAssetWidget(AssetController controller) {
    return Obx(
      () {
        final cashAmount = controller.vtsCashAmount.value;
        num stockAmount = controller.stockAmount.value;
        num debt = controller.vtsLoanAmount.value;
        num asset = cashAmount + stockAmount;
        num netAsset = asset - debt;
        List<_AssetDataViewModel> data = [
          _AssetDataViewModel(
            percent: cashAmount == 0 ? 0 : (cashAmount / asset) * 100,
            color: AppColors.teal,
            value: cashAmount,
            title: 'cash'.tr,
          ),
          _AssetDataViewModel(
            percent: stockAmount == 0 ? 0 : (stockAmount / asset) * 100,
            color: AppColors.selectiveYellow,
            value: stockAmount,
            title: 'stock'.tr,
          ),
          _AssetDataViewModel(
            percent: asset == 0 ? 0 : 100,
            color: AppColors.electricViolet,
            value: asset,
            title: 'assets'.tr,
          ),
          _AssetDataViewModel(
            percent: debt == 0 ? 0 : (debt / asset) * 100,
            color: AppColors.yellowGreen,
            value: debt,
            title: 'total_dept'.tr,
          ),
          _AssetDataViewModel(
            percent: netAsset == 0 ? 0 : (netAsset / asset) * 100,
            color: AppColors.mangoTango,
            value: netAsset,
            title: 'net_assets'.tr,
          ),
        ];
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.white.withOpacity(0.31),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 40,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                    color: Colors.black.withOpacity(0.08),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: data
                    .map(
                      (e) => _AssetColumn(model: e),
                    )
                    .toList(),
              ),
            ),
            Gaps.vGap8,
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.white.withOpacity(0.31),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 40,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                    color: Colors.black.withOpacity(0.08),
                  ),
                ],
              ),
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Container(
                          height: 24,
                          width: 8,
                          decoration: BoxDecoration(
                            color: item.color,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        Gaps.hGap16,
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textTitle,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          item.value.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Gaps.line,
                itemCount: data.length,
              ),
            )
          ],
        );
      },
    );
  }

  Obx _buildHoldingStocksWidget(AssetController controller) {
    return Obx(
      () => Column(
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            direction: Axis.horizontal,
            children: controller.holdingStocks.value
                .getRange(
              0,
              controller.holdingStocks.value.length > 6
                  ? controller.showMore.value
                      ? controller.holdingStocks.value.length
                      : 6
                  : controller.holdingStocks.value.length,
            )
                .map(
              (model) {
                return HoldingStockItem(
                  stockCode: model.stockCode,
                  rate: model.profitlossRate,
                  value: model.profitloss,
                  volumn: model.total,
                  avgBuyPrice: model.avgPrice,
                );
              },
            ).toList(),
          ),
          Gaps.vGap10,
          if (controller.holdingStocks.value.length > 6)
            InkWell(
                onTap: () =>
                    controller.showMore.value = !controller.showMore.value,
                child: Icon(controller.showMore.value
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down)),
        ],
      ),
    );
  }
}

class _AssetColumn extends StatelessWidget {
  const _AssetColumn({
    Key? key,
    required this.model,
  }) : super(key: key);

  final _AssetDataViewModel model;

  @override
  Widget build(BuildContext context) {
    double height = model.percent <= 0 || model.percent.isNaN
        ? 0
        : 145 * (model.percent / 100);
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            model.percent.toString(),
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          Gaps.vGap5,
          Container(
            height: height,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: model.color,
            ),
          ),
          Gaps.vGap8,
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textTitle,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _AssetDataViewModel {
  num percent;
  final Color color;
  final num value;
  final String title;
  final Function()? onPressed;

  _AssetDataViewModel({
    required this.percent,
    required this.color,
    required this.value,
    required this.title,
    this.onPressed,
  }) {
    if (percent > 100) {
      percent = 100;
    }
  }
}
