import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtsv4/resource/app_colors.dart';

class CustomMbs extends StatelessWidget {
  const CustomMbs({
    Key? key,
    required this.body,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  final Widget body;

  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => Get.back(),
          child: Container(
            height: kToolbarHeight + Get.mediaQuery.viewPadding.top,
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(21),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: crossAxisAlignment,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 20),
                    height: 5,
                    width: 36,
                    decoration: BoxDecoration(
                      color: AppColors.textDisable,
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),
                ),
                body,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
