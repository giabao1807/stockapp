import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mtsv4/extentions.dart';
import 'package:mtsv4/styles/helper/dimentions.dart';
import 'package:mtsv4/styles/helper/font_size.dart';
import 'package:mtsv4/styles/helper/font_weight.dart';
import 'package:mtsv4/styles/helper/scaling_utlis.dart';
import 'package:mtsv4/styles/theme/colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  // final Widget child;
  final String icon;
  final String title;
  final String subTitle;
  final dynamic onPressed;
  double? width = contentSize.width;
  // double? height = moderate(20);
  CustomButton({
    Key? key,
    required this.onPressed,
    this.width,
    required this.icon,
    required this.title,
    required this.subTitle,
    // this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: styles['PRIMARY__BG__COLOR']!.toColor(),
            shadowColor: Colors.transparent,
            minimumSize: Size(contentSize.width, moderate(30))),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.all(moderate(15)),
              child: SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                    styles['PRIMARY__CONTENT__COLOR']!.toColor(),
                    BlendMode.srcIn),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.tr,
                    style: TextStyle(
                        fontSize: fontSizes.normal,
                        color: styles['PRIMARY__CONTENT__COLOR']!.toColor()),
                  ),
                  if (subTitle != '')
                    Text(subTitle.tr,
                        style: TextStyle(
                            fontSize: fontSizes.tiny,
                            fontWeight: fontWeights.light,
                            color:
                                styles['PRIMARY__CONTENT__COLOR']!.toColor()))
                ],
              ),
            ),
            SvgPicture.asset(
              'assets/images/ic_arrow_right.svg',
              colorFilter: ColorFilter.mode(
                  styles['PRIMARY__CONTENT__COLOR']!.toColor(),
                  BlendMode.srcIn),
            ),
          ],
        ));
  }
}
