import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtsv4/resource/app_colors.dart';

enum NotificationType { SUCCESS, ERROR }

extension NotificationTypeExt on NotificationType {
  Color get color {
    switch (this) {
      case NotificationType.SUCCESS:
        return AppColors.greenButton;
      case NotificationType.ERROR:
        return AppColors.redButton;
    }
  }
}

class AppSnackbar {
  static showErrorNotification({
    required String title,
    required String message,
  }) {
    Get.closeAllSnackbars();
    return Get.rawSnackbar(
      backgroundColor: AppColors.redButton,
      snackPosition: SnackPosition.TOP,
      borderColor: AppColors.redButton,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      borderRadius: 8,
      snackStyle: SnackStyle.GROUNDED,
      animationDuration: const Duration(milliseconds: 300),
      messageText: _SnackBar(
        message: message,
        title: title,
      ),
    );
  }

  static showSuccessNotification({
    required String title,
    required String message,
  }) {
    Get.closeAllSnackbars();
    return Get.rawSnackbar(
      backgroundColor: AppColors.fund,
      snackPosition: SnackPosition.TOP,
      borderColor: AppColors.fund,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      borderRadius: 8,
      snackStyle: SnackStyle.GROUNDED,
      animationDuration: const Duration(milliseconds: 300),
      messageText: _SnackBar(
        message: message,
        title: title,
      ),
    );
  }
}

class _SnackBar extends StatelessWidget {
  const _SnackBar({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          message,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
