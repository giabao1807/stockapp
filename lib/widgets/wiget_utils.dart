import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mtsv4/resource/app_padding.dart';
import 'package:mtsv4/resource/resource.dart';

class WidgetUtils {
  static Center centerLoadingCircle = const Center(
    child: CircularProgressIndicator(
      color: AppColors.blue,
    ),
  );
  static Widget emptyState = Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // SvgPicture.asset(AssetPath.nodata),
        Gaps.vGap24,
        Text(
          'no_data'.tr,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    ),
  );

  static Widget getEmptyState({String title = 'no_data'}) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // SvgPicture.asset(AssetPath.nodata),
            Gaps.vGap24,
            Text(
              title.tr,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      );
  static Widget getErrorState(String? error) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            error ?? 'an_error_occurred_please_try_again_later'.tr,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      );

  static Widget emptyNotification = Padding(
    padding: AppPad.horiz16,
    child: Column(
      children: [
        Gaps.vGap32,
        Image.asset(
          AssetPath.no_notice,
          height: 80,
          width: 80,
        ),
        Gaps.vGap24,
        Text(
          'nothing_here'.tr,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textContent,
          ),
        ),
        Gaps.vGap8,
        Text(
          'no_notification_description'.tr,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: AppColors.textContent,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
