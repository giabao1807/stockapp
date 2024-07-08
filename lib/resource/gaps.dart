import 'package:flutter/material.dart';
import 'package:mtsv4/resource/app_colors.dart';
import 'package:mtsv4/resource/dimens.dart';

class Gaps {
  // Khoang cach ngang
  static const Widget hGap3 = SizedBox(width: Dimens.gap_dp3);
  static const Widget hGap4 = SizedBox(width: Dimens.gap_dp4);
  static const Widget hGap5 = SizedBox(width: Dimens.gap_dp5);
  static const Widget hGap6 = SizedBox(width: Dimens.gap_dp6);
  static const Widget hGap8 = SizedBox(width: Dimens.gap_dp8);
  static const Widget hGap10 = SizedBox(width: Dimens.gap_dp10);
  static const Widget hGap12 = SizedBox(width: Dimens.gap_dp12);
  static const Widget hGap15 = SizedBox(width: Dimens.gap_dp15);
  static const Widget hGap16 = SizedBox(width: Dimens.gap_dp16);
  static const Widget hGap18 = SizedBox(width: Dimens.gap_dp18);
  static const Widget hGap20 = SizedBox(width: Dimens.gap_dp20);
  static const Widget hGap24 = SizedBox(width: Dimens.gap_dp24);
  static const Widget hGap25 = SizedBox(width: Dimens.gap_dp25);
  static const Widget hGap32 = SizedBox(width: Dimens.gap_dp32);
  static const Widget hGap40 = SizedBox(width: Dimens.gap_dp40);
  // Khoang cach doc
  static const Widget vGap1 = SizedBox(height: Dimens.gap_dp1);
  static const Widget vGap2 = SizedBox(height: Dimens.gap_dp2);
  static const Widget vGap3 = SizedBox(height: Dimens.gap_dp3);
  static const Widget vGap4 = SizedBox(height: Dimens.gap_dp4);
  static const Widget vGap5 = SizedBox(height: Dimens.gap_dp5);
  static const Widget vGap6 = SizedBox(height: 6);
  static const Widget vGap8 = SizedBox(height: Dimens.gap_dp8);
  static const Widget vGap10 = SizedBox(height: Dimens.gap_dp10);
  static const Widget vGap12 = SizedBox(height: Dimens.gap_dp12);
  static const Widget vGap15 = SizedBox(height: Dimens.gap_dp15);
  static const Widget vGap16 = SizedBox(height: Dimens.gap_dp16);
  static const Widget vGap20 = SizedBox(height: Dimens.gap_dp20);
  static const Widget vGap24 = SizedBox(height: Dimens.gap_dp24);
  static const Widget vGap25 = SizedBox(height: Dimens.gap_dp25);
  static const Widget vGap30 = SizedBox(height: Dimens.gap_dp30);
  static const Widget vGap32 = SizedBox(height: Dimens.gap_dp32);
  static const Widget vGap40 = SizedBox(height: Dimens.gap_dp40);
  static const Widget vGap50 = SizedBox(height: Dimens.gap_dp50);
  static const Widget vGap80 = SizedBox(height: Dimens.gap_dp80);

  static Widget line = const Divider(
    height: 1,
    thickness: 1,
    color: AppColors.background,
  );

  static Widget bigLine = const Divider(
    height: 8,
    thickness: 8,
    color: AppColors.background,
  );

  static Widget vLine = const SizedBox(
    width: 0.6,
    height: 24.0,
    child: VerticalDivider(),
  );

  static const Widget empty = SizedBox.shrink();
}
