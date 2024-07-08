import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtsv4/resource/gaps.dart';
import 'package:mtsv4/utils/extension/num_extension.dart';
import 'package:mtsv4/widgets/app_dialogs.dart';
import 'package:mtsv4/widgets/grid_data/grid_data_header.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../model/stock_top_model.dart';
import '../../../../resource/app_colors.dart';
import '../../../widgets/grid_data/grid_data.dart';
import 'top_trading_controller.dart';
import 'top_trading_selection_mbs.dart';

class TopTradingPage extends StatelessWidget {
  const TopTradingPage({Key? key }) : super(key: key);

  static const TextStyle _title = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textTitle,
  );
  static const TextStyle _data = TextStyle(
    fontSize: 14,
    color: AppColors.textContent,
  );

  static const padding = EdgeInsets.symmetric(horizontal: 5, vertical: 10);

  @override
  Widget build(BuildContext context) {
    final topTradeController =
        GetInstance().putOrFind(() => TopTradingController());

    final topTradingTodayHeader = [
      GridDataHeader<StockTopModel>(
        width: Get.width * 0.191,
        titleRender: () => InkWell(
          onTap: () => topTradeController.sort('S'),
          child: Container(
            color: AppColors.titleTable,
            alignment: Alignment.center,
            padding: padding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'symbol'.tr,
                  style: _title,
                ),
              ],
            ),
          ),
        ),
        cellRender: (data, index) => Container(
          alignment: Alignment.center,
          padding: padding,
          child: Row(
            children: [
              Text(
                data.stockCode,
                style: _data.copyWith(
                  color: data.getColor(data.closePrice),
                ),
              ),
            ],
          ),
        ),
      ),
      GridDataHeader<StockTopModel>(
        width: Get.width * 0.191,
        titleRender: () => InkWell(
          onTap: () => topTradeController.sort('CHGR'),
          child: Container(
            color: AppColors.titleTable,
            alignment: Alignment.center,
            padding: padding,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '%',
                  style: _title,
                ),
              ],
            ),
          ),
        ),
        cellRender: (data, index) {
          return Container(
            alignment: Alignment.centerRight,
            padding: padding,
            child: Text(
              data.changRatio.displayRatio,
              style: _data.copyWith(
                color: data.getColor(data.currentPrice),
              ),
            ),
          );
        },
      ),
      GridDataHeader<StockTopModel>(
        width: Get.width * 0.205,
        titleRender: () => InkWell(
          onTap: () => topTradeController.sort('O'),
          child: Container(
            color: AppColors.titleTable,
            alignment: Alignment.center,
            padding: padding,
            child: FittedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'open'.tr,
                    style: _title,
                  ),
                ],
              ),
            ),
          ),
        ),
        cellRender: (data, index) => Container(
          alignment: Alignment.centerRight,
          padding: padding,
          child: Text(
            data.openPrice.display,
            style: _data.copyWith(
              color: data.getColor(data.openPrice),
            ),
          ),
        ),
      ),
      GridDataHeader<StockTopModel>(
        width: Get.width * 0.205,
        titleRender: () => InkWell(
          onTap: () => topTradeController.sort('C'),
          child: Container(
            color: AppColors.titleTable,
            alignment: Alignment.center,
            padding: padding,
            child: FittedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'current'.tr,
                    style: _title,
                  ),
                ],
              ),
            ),
          ),
        ),
        cellRender: (data, index) => Container(
          alignment: Alignment.centerRight,
          padding: padding,
          child: Text(
            data.currentPrice.display,
            style: _data.copyWith(
              color: data.getColor(data.closePrice),
            ),
          ),
        ),
      ),
      GridDataHeader<StockTopModel>(
        width: Get.width * 0.205,
        titleRender: () => InkWell(
          onTap: () => topTradeController.sort(
              topTradeController.selectedTopType.value == TopType.TA
                  ? 'TVAL'
                  : 'TVOL'),
          child: Container(
            color: AppColors.titleTable,
            alignment: Alignment.center,
            padding: padding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  topTradeController.selectedTopType.value == TopType.TA
                      ? 'value'.tr
                      : 'volume'.tr,
                  style: _title,
                ),
              ],
            ),
          ),
        ),
        cellRender: (data, index) => Container(
          alignment: Alignment.centerRight,
          padding: padding,
          child: Text(
            topTradeController.selectedTopType.value == TopType.TA
                ? data.tradingValue.compact
                : data.tradingVolumn.compact,
            style: _data.copyWith(
              color: AppColors.textContent,
            ),
          ),
        ),
      ),
    ];
    final configHeader = [
      GridDataHeader<StockTopModel>(
        width: Get.width * 0.191,
        titleRender: () => InkWell(
          onTap: () => topTradeController.sort('S'),
          child: Container(
            color: AppColors.titleTable,
            alignment: Alignment.center,
            padding: padding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'symbol'.tr,
                  style: _title,
                ),
              ],
            ),
          ),
        ),
        cellRender: (data, index) => Container(
          alignment: Alignment.center,
          padding: padding,
          child: Text(
            data.stockCode,
            style: _data,
          ),
        ),
      ),
      GridDataHeader<StockTopModel>(
        width: Get.width * 0.191,
        titleRender: () => InkWell(
          onTap: () => topTradeController.sort('CHGR'),
          child: Container(
            color: AppColors.titleTable,
            alignment: Alignment.centerRight,
            padding: padding,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '%',
                  style: _title,
                ),
              ],
            ),
          ),
        ),
        cellRender: (data, index) {
          return Container(
            alignment: Alignment.centerRight,
            padding: padding,
            child: Text(
              data.changRatio.displayRatio,
              style: _data.copyWith(
                color: data.changRatio.color,
              ),
            ),
          );
        },
      ),
      GridDataHeader<StockTopModel>(
        width: Get.width * 0.206,
        titleRender: () => InkWell(
          onTap: () => topTradeController.sort('L'),
          child: Container(
            color: AppColors.titleTable,
            alignment: Alignment.centerRight,
            padding: padding,
            child: Text(
              'lowest'.tr,
              style: _title,
            ),
          ),
        ),
        cellRender: (data, index) => Container(
          alignment: Alignment.centerRight,
          padding: padding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data.lowestPrice.display,
                style: _data,
              ),
            ],
          ),
        ),
      ),
      GridDataHeader<StockTopModel>(
        width: Get.width * 0.206,
        titleRender: () => InkWell(
          onTap: () => topTradeController.sort('H'),
          child: Container(
            color: AppColors.titleTable,
            alignment: Alignment.centerRight,
            padding: padding,
            child: Text(
              'highest'.tr,
              style: _title,
            ),
          ),
        ),
        cellRender: (data, index) => Container(
          alignment: Alignment.centerRight,
          padding: padding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data.hightestPrice.display,
                style: _data,
              ),
            ],
          ),
        ),
      ),
      GridDataHeader<StockTopModel>(
        width: Get.width * 0.206,
        titleRender: () => InkWell(
          onTap: () => topTradeController.sort(
              topTradeController.selectedTopType.value == TopType.TA
                  ? 'TVAL'
                  : 'TVOL'),
          child: Container(
            color: AppColors.titleTable,
            alignment: Alignment.center,
            padding: padding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  topTradeController.selectedTopType.value == TopType.TA
                      ? 'value'.tr
                      : 'volume'.tr,
                  style: _title,
                ),
              ],
            ),
          ),
        ),
        cellRender: (data, index) => Container(
          alignment: Alignment.centerRight,
          padding: padding,
          child: Text(
            topTradeController.selectedTopType.value == TopType.TA
                ? data.tradingValue.compact
                : data.tradingVolumn.compact,
            style: _data.copyWith(
              color: AppColors.textContent,
            ),
          ),
        ),
      ),
    ];


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Obx(
        //   () => InkWell(
        //     onTap: () => Get.bottomSheet(
        //       TopTradingSelectionMbs(
        //         data: topTradeController.selectedTopType.value,
        //         items: TopType.values,
        //         onSelected: (value) {
        //           topTradeController.onChangeTopTrading(value);
        //           AppDialogs.hideDialog();
        //         },
        //       ),
        //       ignoreSafeArea: false,
        //       isScrollControlled: true,
        //       backgroundColor: Colors.transparent,
        //       barrierColor: AppColors.blueBg.withOpacity(0.6),
        //     ),
        //     child: Ink(
        //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        //       child: Row(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           Text(
        //             topTradeController.selectedTopType.value.display,
        //             style: const TextStyle(
        //               fontSize: 14,
        //               color: AppColors.yellow,
        //               fontWeight: FontWeight.w500,
        //               height: 18 / 14,
        //             ),
        //           ),
        //           Gaps.hGap8,
        //           // SvgPicture.asset(
        //           //   AssetPath.arrow_down,
        //           //   color: AppColors.yellow,
        //           //   width: 20,
        //           //   height: 20,
        //           // )
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        const Divider(
          color: AppColors.background,
          height: 1,
          thickness: 1,
        ),
        DefaultTabController(
          length: TimeQuery.values.length,
          child: TabBar(
            indicatorWeight: 3,
            onTap: topTradeController.onChangeTimeQuerry,
            unselectedLabelColor: AppColors.textTitle,
            labelColor: AppColors.blueBg,
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            indicator: MaterialIndicator(
              color: AppColors.smartBanking,
              bottomLeftRadius: 3,
              bottomRightRadius: 3,
              topLeftRadius: 3,
              topRightRadius: 3,
            ),
            tabs: TimeQuery.values
                .map((e) => Tab(
                      text: e.display,
                    ))
                .toList(),
          ),
        ),
        Expanded(
          child: topTradeController.obx(
            (state) => state == null
                ? Gaps.empty
                : GridData<StockTopModel>(
                    controller: topTradeController.gridDataController,
                    configHeader:
                        topTradeController.timeQuery.value == TimeQuery.TODAY
                            ? topTradingTodayHeader
                            : configHeader,
                    items: state,
                    fixedDivider: const VerticalDivider(
                      color: AppColors.background,
                      thickness: 1,
                      width: 1,
                    ),
                    separatorBuilder: (_, __) => const Divider(
                      color: AppColors.background,
                      thickness: 1,
                      height: 1,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
