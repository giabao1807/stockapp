import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtsv4/resource/app_colors.dart';
import 'package:mtsv4/resource/app_text_styles.dart';

class FillButton extends StatelessWidget {
  const FillButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.padding,
    this.width,
    this.rightIcon,
    this.leftIcon,
    this.backgroundColor,
    this.elevation = 0,
    this.style,
    this.shape,
  }) : super(key: key);

  final String text;

  final VoidCallback? onPressed;

  final EdgeInsetsGeometry? padding;

  final double? width;

  final Widget? rightIcon;

  final Widget? leftIcon;

  final Color? backgroundColor;

  final double elevation;

  final TextStyle? style;

  final OutlinedBorder? shape;

  factory FillButton.cancel({Function()? onPressed, String? text}) =>
      FillButton(
        onPressed: onPressed ?? Get.back,
        text: text ?? 'cancel'.tr,
        width: double.infinity,
        style: AppTextStyles.button.copyWith(
          fontWeight: FontWeight.w300,
          color: AppColors.textBigTitle,
        ),
        backgroundColor: AppColors.background,
      );

  @override
  Widget build(BuildContext context) {
    Widget child = Text(
      text,
      style: style ?? AppTextStyles.button,
      textAlign: TextAlign.center,
    );

    if (leftIcon != null) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [leftIcon!.marginOnly(right: 10), child],
      );
    }
    if (rightIcon != null) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
          rightIcon!.marginOnly(left: 10),
        ],
      );
    }

    Widget current = ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding,
        disabledBackgroundColor:
            (backgroundColor ?? AppColors.blueBg).withOpacity(0.5),
        shadowColor: backgroundColor,
        elevation: elevation,
        shape: shape,
      ),
    );
    if (width != null) current = SizedBox(width: width, child: current);

    return current;
  }
}
