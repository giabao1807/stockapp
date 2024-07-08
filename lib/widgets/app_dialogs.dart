import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtsv4/resource/app_colors.dart';
import 'package:mtsv4/resource/app_padding.dart';
import 'package:mtsv4/resource/asset_path.dart';
import 'package:mtsv4/resource/gaps.dart';
import 'package:mtsv4/widgets/fill_button.dart';

_navigateBack() => Get.back(result: false);

class AppDialogs {
  static hideDialog() => _navigateBack();
  static showLoadingCircle() => Get.dialog(
        WillPopScope(
          onWillPop: () async => false,
          child: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width / 3,
                  child: const LinearProgressIndicator(
                    color: AppColors.greenButton,
                  ),
                ),
              ],
            ),
          ),
        ),
        barrierDismissible: false,
        routeSettings: const RouteSettings(name: 'loading'),
      );

  static hideLoadingCircle() => _navigateBack();

  // static Future showSuccessDialog({
  //   String? description,
  //   String? affirmativeText,
  //   dynamic Function()? onAffirmativeBtnPressed,
  //   Color? affirmativeBtnColor,
  //   String icon = AssetPath.success,
  // }) =>
  //     Get.dialog(
  //       WillPopScope(
  //         onWillPop: () async {
  //           return false;
  //         },
  //         child: SuccessDialog(
  //           affirmativeBtnColor: affirmativeBtnColor,
  //           affirmativeText: affirmativeText ?? 'login'.tr,
  //           onAffirmativeBtnPressed: onAffirmativeBtnPressed,
  //           description: description ?? 'registration_successful'.tr,
  //           icon: icon,
  //         ),
  //       ),
  //       barrierDismissible: false,
  //       barrierColor: AppColors.blueBg.withOpacity(0.6),
  //     );

  // static showNotificationDialog({
  //   String? title,
  //   dynamic description,
  //   String? confirmText,
  //   dynamic Function()? onConfirmBtnPressed,
  //   dynamic Function()? onCancelBtnPressed,
  //   Color? affirmativeBtnColor,
  //   bool showCancelButton = false,
  //   String icon = AssetPath.warning,
  //   bool barrierDismissible = false,
  // }) =>
  //     Get.dialog(
  //       WillPopScope(
  //         onWillPop: () => Future.value(barrierDismissible),
  //         child: NotificationDialog(
  //           affirmativeBtnColor: affirmativeBtnColor,
  //           confirmText: confirmText ?? 'ok'.tr,
  //           onConfirmBtnPressed: onConfirmBtnPressed,
  //           description: description ?? 'notification'.tr,
  //           icon: icon,
  //           title: title ?? 'notification'.tr,
  //           showCancelButton: showCancelButton,
  //           onCancelBtnPressed: onCancelBtnPressed,
  //         ),
  //       ),
  //       barrierDismissible: barrierDismissible,
  //       barrierColor: AppColors.blueBg.withOpacity(0.6),
  //     );

  static showDialog({
    String? title,
    // ignore: unnecessary_question_mark
    dynamic description,
    String? confirmText,
    dynamic Function()? onConfirmBtnPressed,
    Color? affirmativeBtnColor,
    bool showCancelButton = false,
    bool barrierDismissible = true,
    String icon = '',
  }) =>
      Get.dialog(
        barrierDismissible: barrierDismissible,
        NotificationDialog(
          affirmativeBtnColor: affirmativeBtnColor,
          confirmText: confirmText ?? 'ok'.tr,
          onConfirmBtnPressed: onConfirmBtnPressed,
          description: description ?? 'notification'.tr,
          icon: icon,
          title: title ?? 'notification'.tr,
          showCancelButton: showCancelButton,
        ),
        barrierColor: AppColors.blueBg.withOpacity(0.6),
      );

  // static showConfirmDeleteDialog(
  //         {Function()? onConfirmButtonPressed, required String title}) =>
  //     Get.dialog(
  //       ConfirmDeleteDialog(
  //         title: title,
  //         onConfirmButtonPressed: onConfirmButtonPressed,
  //       ),
  //       barrierColor: AppColors.blueBg.withOpacity(0.6),
  //     );

  static showMbs(
          {required Widget mbs,
          String name = '',
          bool isScrollControlled = true}) =>
      Get.bottomSheet(
        mbs,
        isScrollControlled: isScrollControlled,
        enableDrag: true,
        backgroundColor: Colors.transparent,
        settings: RouteSettings(name: 'MBS $name'),
        ignoreSafeArea: false,
        barrierColor: AppColors.blueBg.withOpacity(0.6),
      );

  // static Future<void> showImage(
  //   BuildContext context, {
  //   required ImageProvider imageProvider,
  //   required Object heroTag,
  //   String? dialogSettingName,
  // }) =>
  //     Get.dialog(
  //       Dialog(
  //         backgroundColor: Colors.transparent,
  //         insetPadding: EdgeInsets.zero,
  //         child: ImageView(
  //           imageProvider: imageProvider,
  //           heroTag: heroTag,
  //         ),
  //       ),
  //       useSafeArea: false,
  //       barrierColor: AppColors.blueBg.withOpacity(0.6),
  //       routeSettings: RouteSettings(name: dialogSettingName),
  //     );
}



class NotificationDialog extends StatelessWidget {
  const NotificationDialog({
    Key? key,
    this.title,
    this.description,
    this.confirmText,
    this.onConfirmBtnPressed,
    this.affirmativeBtnColor,
    this.icon = AssetPath.warning,
    this.showCancelButton = false,
    this.onCancelBtnPressed,
  }) : super(key: key);

  final String? title;

  final dynamic description;

  final Function()? onConfirmBtnPressed;
  final Function()? onCancelBtnPressed;

  final String? confirmText;

  final Color? affirmativeBtnColor;

  final String icon;

  final bool showCancelButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: AppPad.all16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null && title!.isNotEmpty)
              Text(
                title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  color: AppColors.textTitle,
                  fontWeight: FontWeight.w700,
                ),
              ),
            Gaps.vGap16,
            description is String
                ? Text(
                    description ?? 'notification'.tr,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.textContent,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Text.rich(
                    description,
                    textAlign: TextAlign.justify,
                  ),
            Visibility(
              visible: onConfirmBtnPressed != null,
              child: FillButton(
                text: confirmText ?? 'notification'.tr,
                width: Get.width,
                onPressed: onConfirmBtnPressed,
                backgroundColor: affirmativeBtnColor,
              ).marginOnly(top: 16),
            ),
            if (showCancelButton)
              FillButton(
                text: 'cancel'.tr,
                width: Get.width,
                onPressed: onCancelBtnPressed ?? Get.back,
                style: const TextStyle(color: AppColors.textContent),
                backgroundColor: AppColors.background,
              ).marginOnly(top: 16),
          ],
        ),
      ),
    );
  }
}