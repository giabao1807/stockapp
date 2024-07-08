import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mtsv4/resource/app_colors.dart';
import 'package:mtsv4/resource/resource.dart';

import 'top_trading_controller.dart';

class TopTradingPage extends StatelessWidget {
  const TopTradingPage({Key? key}) : super(key: key);

  static const TextStyle _title = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textTitle,
  );
  static const TextStyle _data = TextStyle(
    fontSize: 14,
    color: AppColors.textContent,
  );

  static const padding = EdgeInsets.symmetric(horizontal: 5, vertical: 10);

  @override
  Widget build(BuildContext context) {
    final controller = GetInstance().putOrFind(() => TopTradingController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [],
    );
  }
}
