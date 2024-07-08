import 'package:flutter/material.dart';
import 'package:mtsv4/resource/app_colors.dart';

class AppBorderAndRadius {
  static Border uniformBorder = const Border.fromBorderSide(
    BorderSide(
      color: AppColors.separator,
      width: 0.5,
    ),
  );

  static const defaultRadius = Radius.circular(15);

  static const radius13 = Radius.circular(13);
  static const radius8 = Radius.circular(8);
  static const radius10 = Radius.circular(10);
  static const formRadius = Radius.circular(15);

  static const dialogRadius = Radius.circular(21);

  static const defaultBorderRadius = BorderRadius.all(defaultRadius);

  static const focusItemMenuRadius = BorderRadius.all(radius13);

  static const formBorderRadius = BorderRadius.all(formRadius);

  static const dialogBorderRadius = BorderRadius.all(dialogRadius);

  static const bottomSheetBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(20), topRight: Radius.circular(20));

  static OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.background,
      width: 1,
    ),
    borderRadius: formBorderRadius,
  );

  static const OutlineInputBorder outlineInputErrorBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.red),
    borderRadius: formBorderRadius,
  );
}
