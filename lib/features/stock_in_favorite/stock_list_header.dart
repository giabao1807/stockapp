import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtsv4/resource/app_colors.dart';
import 'package:mtsv4/resource/gaps.dart';
import 'package:mtsv4/utils/enum/sort_type.dart';

class StockListHeader extends StatelessWidget {
  const StockListHeader({
    Key? key,
    this.onSortSymbolPressed,
    this.onSortValueChangeRatioPressed,
    required this.sortColumn,
    this.onAddStockButtonPressed,
    this.onOrderButtonPressed,
    this.onOrderRotatePressed,
    this.isFavoriteTab = false,
    this.showShowCase = false,
  }) : super(key: key);

  final Function(SortType type)? onSortSymbolPressed;

  final Function(SortType type)? onSortValueChangeRatioPressed;

  final RxString sortColumn;

  final Function()? onAddStockButtonPressed;

  final Function()? onOrderButtonPressed;

  final Function()? onOrderRotatePressed;

  final bool isFavoriteTab;

  final bool showShowCase;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          ObxValue<Rx<SortType>>(
            (type) => InkWell(
              onTap: () {
                if (onSortSymbolPressed == null) return;
                if (type.value == SortType.idle || type.value == SortType.up) {
                  type(SortType.down);
                } else {
                  type(SortType.up);
                }
                onSortSymbolPressed?.call(type.value);
              },
              child: Row(
                children: [
                  Text(
                    'symbol'.tr,
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          type.value != SortType.idle && sortColumn.value == 'S'
                              ? AppColors.yellow
                              : AppColors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Rx(SortType.idle),
          ),
          Gaps.hGap24,
          const Spacer(),
          ObxValue<Rx<SortType>>(
            (type) => InkWell(
              onTap: () {
                if (onSortValueChangeRatioPressed == null) return;
                if (type.value == SortType.idle || type.value == SortType.up) {
                  type(SortType.down);
                } else {
                  type(SortType.up);
                }
                onSortValueChangeRatioPressed?.call(type.value);
              },
              child: Row(
                children: [
                  Text(
                    'change'.tr,
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          type.value != SortType.idle && sortColumn.value == 'C'
                              ? AppColors.yellow
                              : AppColors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Rx(SortType.idle),
          ),
        ],
      ),
    );
  }
}
