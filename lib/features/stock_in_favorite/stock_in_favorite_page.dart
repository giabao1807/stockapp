// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:mtsv4/features/market_tab/market_tab.dart';
// import 'package:mtsv4/features/stock_in_favorite/stock_item.dart';
// import 'package:mtsv4/resource/app_colors.dart';
// import 'package:mtsv4/resource/asset_path.dart';
// import 'package:mtsv4/resource/gaps.dart';
// import 'package:mtsv4/widgets/fill_button.dart';

// import 'stock_in_favorite_controller.dart';
// import 'stock_list_header.dart';

// class StockInFavoritePage extends StatelessWidget {
//   const StockInFavoritePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<StockInFavoriteController>(
//       init: StockInFavoriteController(),
//       builder: (controller) => Column(
//         children: [
//           StockListHeader(
//             isFavoriteTab: true,
//             sortColumn: controller.sortColumn,
//             // onSortSymbolPressed: controller.sortByStockCode,
//             // onSortValueChangeRatioPressed: controller.sortByRatioChange,
//             // onAddStockButtonPressed: controller.onAddStockButtonPressed,
//             // onOrderButtonPressed: controller.onOrderButtonPressed,
//             // onOrderRotatePressed: () => Get.to(
//             //   () => HorizontalPriceScreen(
//             //     items: controller.stocks.value.toList(),
//             //   ),
//             // ),
//           ),
//           Expanded(
//             child: Obx(
//               () => controller.stocks.value.isEmpty
//                   ? Column(
//                       children: [
//                         Gaps.vGap32,
//                         SvgPicture.asset(AssetPath.ic_empty),
//                         Gaps.vGap16,
//                         Text('no_symbols_in_watchlist'.tr),
//                         Gaps.vGap5,
//                         Text(
//                           'let_add_stock_now'.tr,
//                           style: const TextStyle(
//                             color: AppColors.textDisable,
//                           ),
//                         ),
//                         Gaps.vGap40,
//                         FillButton(
//                           text: 'new_stock'.tr,
//                           // onPressed: controller.onAddStockButtonPressed,
//                           leftIcon: SvgPicture.asset(
//                             AssetPath.add,
//                             color: AppColors.white,
//                             width: 20,
//                           ),
//                           backgroundColor: AppColors.credit,
//                           width: Get.width - 32,
//                         )
//                       ],
//                     )
//                   : ListView.separated(
//                       padding: EdgeInsets.zero,
//                       itemCount: controller.stocks.value.length,
//                       itemBuilder: (context, index) => Obx(
//                         () {
//                           final item = controller.stocks.value[index];
//                           return StockItem(
//                             stockCode: item,
//                           );
//                         },
//                       ),
//                       separatorBuilder: (context, index) => const Divider(
//                         thickness: 1,
//                         height: 1,
//                         color: AppColors.background,
//                       ),
//                     ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
