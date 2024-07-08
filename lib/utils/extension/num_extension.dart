import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mtsv4/resource/app_colors.dart';

import '../../resource/asset_path.dart';

extension NumExt on num {
  Color get color => this > 0
      ? AppColors.green
      : this < 0
          ? AppColors.red
          : AppColors.yellow;

  String _formatNumber(num? value, int digit, [String pattern = '.']) {
    if (value != null) {
      for (var i = 0; i < digit; i++) {
        pattern = '$pattern#';
      }
      final oCcy = NumberFormat('#,###$pattern', 'en');
      return oCcy.format(value);
    }

    return '0';
  }

  String _formatNumberVND(num? value, int digit, [String pattern = '.']) {
    if (value != null) {
      for (var i = 0; i < digit; i++) {
        pattern = '$pattern#';
      }
      final oCcy = NumberFormat('#,###$pattern', 'vi');
      return oCcy.format(value);
    }

    return '0';
  }

  String get icon => this > 0
      ? AssetPath.up
      : this < 0
          ? AssetPath.down
          : '';

  String get format => _formatNumber(this, 2);
  String get formatVND => _formatNumberVND(this, 2);

  bool get isZero => this == 0;

  String get compact => NumberFormat.compactCurrency(
        decimalDigits: 2,
        symbol: '',
      ).format(this);

  String get compactLike => NumberFormat.compactCurrency(
        decimalDigits: 0,
        symbol: '',
      ).format(this);

  String get display => format;

  String get displayRatio =>
      this == 0 ? '0.00%' : '${isNegative ? '' : '+'}$format%';

  String get formatBidAsk => this == 777777710000
      ? 'ATO'
      : this == 777777720000
          ? 'ATC'
          : this == 0
              ? ''
              : format;
}
