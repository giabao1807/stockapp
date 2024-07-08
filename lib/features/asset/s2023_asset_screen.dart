import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtsv4/features/asset/asset_page/my_asset_page.dart';
import 'package:mtsv4/resource/app_colors.dart';
import 'package:mtsv4/resource/app_padding.dart';
import 'package:mtsv4/resource/asset_path.dart';
import 'package:mtsv4/resource/gaps.dart';
import 'package:mtsv4/widgets/account_widget.dart';

class AssetScreen extends StatelessWidget {
  const AssetScreen({
    Key? key,
    this.initialIndex = 0,
    this.onButtonBackPressed,
  }) : super(key: key);

  final int initialIndex;
  final void Function()? onButtonBackPressed;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: initialIndex,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            Container(
              width: Get.width,
              height: 96,
              alignment: Alignment.bottomCenter,
              padding: AppPad.horiz16.copyWith(
                bottom: 6,
              ),
              child: Row(
                children: [
                  if (onButtonBackPressed != null)
                    BackButton(
                      onPressed: onButtonBackPressed,
                      color: AppColors.white,
                    ),
                  Text(
                    'my_asset'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Gaps.vGap10,
            const Expanded(
              child: AssetPage(),
            ),
          ],
        ),
      ),
    );
  }
}
