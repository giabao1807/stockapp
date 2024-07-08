// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:mtsv4/presentation/auth_controller.dart';
// import 'package:mtsv4/presentation/global_controller.dart';
// import 'package:mtsv4/resource/app_border_and_radius.dart';
// import 'package:mtsv4/resource/app_colors.dart';
// import 'package:mtsv4/resource/gaps.dart';

// class StockItem extends StatelessWidget {
//   const StockItem({
//     Key? key,
//     required this.stockCode,
//     this.onDelete,
//   }) : super(key: key);

//   final String stockCode;

//   final void Function(String stockCode)? onDelete;

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       final model = GetInstance().find<GlobalService>().getData(stockCode);
//       return Container(
//         decoration: const BoxDecoration(
//           borderRadius: AppBorderAndRadius.focusItemMenuRadius,
//           color: AppColors.white,
//         ),
//         padding: const EdgeInsets.all(8),
//         child: Row(
//           children: [
//             Expanded(
//               flex: 48,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     model.stockCode,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.blue,
//                     ),
//                   ),
//                   Text(
//                     model.stockName,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: AppColors.lightBlue,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Gaps.hGap10,
//             Expanded(
//               flex: 23,
//               child: SizedBox(),
//             ),
//             Gaps.hGap10,
//             Expanded(
//               flex: 30,
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       color: model.color,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Text(
//                       model.value.format,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         color: AppColors.white,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   Gaps.vGap1,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           model.ratioChange.displayRatio,
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: model.color,
//                           ),
//                         ),
//                       ),
//                       model.ratioChange == 0
//                           ? Gaps.hGap18
//                           : SvgPicture.asset(
//                               model.icon,
//                               width: 18,
//                               color: model.color,
//                             ),
//                       Expanded(
//                         child: Text(
//                           model.change.display,
//                           textAlign: TextAlign.end,
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: model.color,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
