import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mtsv4/resource/asset_path.dart';
import 'package:mtsv4/resource/gaps.dart';
import 'package:mtsv4/utils/enum/sort_type.dart';

class SortIcon extends StatelessWidget {
  const SortIcon({
    Key? key,
    required this.type,
    required this.column,
    required this.sortColumn,
    this.size = 16,
    this.showIconWhenIdle = false,
  }) : super(key: key);

  final SortType type;

  final String column;

  final String sortColumn;

  final double size;

  final bool showIconWhenIdle;

  @override
  Widget build(BuildContext context) {
    if (sortColumn != column) {
      return showIconWhenIdle == false
          ? Gaps.empty
          : SvgPicture.asset(
              AssetPath.sort_idle,
              height: size,
              width: size,
            );
    }
    switch (type) {
      case SortType.down:
        return SvgPicture.asset(
          AssetPath.sorting_down,
          height: size,
          width: size,
        );
      case SortType.up:
        return SvgPicture.asset(
          AssetPath.sorting_up,
          height: size,
          width: size,
        );
      default:
        return showIconWhenIdle == false
            ? Gaps.empty
            : SvgPicture.asset(
                AssetPath.sort_idle,
                height: size,
                width: size,
              );
    }
  }
}
