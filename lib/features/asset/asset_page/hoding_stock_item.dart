import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mtsv4/resource/app_border_and_radius.dart';
import 'package:mtsv4/resource/app_colors.dart';
import 'package:mtsv4/resource/gaps.dart';
import 'package:mtsv4/utils/extension/num_extension.dart';

class HoldingStockItem extends StatelessWidget {
  const HoldingStockItem({
    Key? key,
    required this.value,
    required this.rate,
    required this.stockCode,
    this.booster = false,
    required this.volumn,
    this.onBuyOrderSuccess,
    required this.avgBuyPrice,
  }) : super(key: key);

  final num value;

  final num rate;

  final String stockCode;

  final bool booster;

  final num volumn;

  final Function()? onBuyOrderSuccess;

  final num avgBuyPrice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: Get.width / 3 - 16,
        padding: const EdgeInsets.only(top: 8, bottom: 13),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.blueBanner.withOpacity(0.1),
            width: 1,
          ),
          color: AppColors.blueBanner.withOpacity(0.1),
          borderRadius: AppBorderAndRadius.defaultBorderRadius,
        ),
        child: Column(
          children: [
            Text(
              stockCode,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.vGap4,
            Text(
              volumn.format,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.textContent,
              ),
            ),
            Gaps.vGap4,
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: value.isNaN ? '0' : value.format,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      // color: rate.color,
                    ),
                  ),
                  const TextSpan(
                    text: ' VND',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: AppColors.textContent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerPainter extends CustomPainter {
  final Color color;

  BannerPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.01031900, size.height);
    path_0.lineTo(size.width * 0.9880978, 0);
    path_0.lineTo(size.width * 0.3436533, 0);
    path_0.cubicTo(
        size.width * 0.1595573,
        0,
        size.width * 0.01031900,
        size.height * 0.1526302,
        size.width * 0.01031900,
        size.height * 0.3409091);
    path_0.lineTo(size.width * 0.01031900, size.height);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant BannerPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
