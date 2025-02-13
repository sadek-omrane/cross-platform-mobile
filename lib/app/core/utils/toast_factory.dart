import 'package:cross_platforme_mobile/app/core/colors/app_colors.dart';
import 'package:cross_platforme_mobile/app/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:toastification/toastification.dart';

class ToastFactory {
  // message toast
  static void message(String message, {String? route, dynamic args}) {
    toastification.show(
      title: Text(
        'Message',
        style: AppTextTheme.bodyLarge,
      ),
      description: Text(
        message,
        style: AppTextTheme.bodyMedium.copyWith(color: AppColors.accent12),
      ),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 5),
      type: ToastificationType.info,
      icon: Icon(Bootstrap.chat_dots_fill, size: 20),
      padding: EdgeInsets.all(10),
      showProgressBar: false,
    );
  }

  // notification toast
  static void notification(String message, {String? route, dynamic args}) {
    toastification.show(
      title: Text(
        'Notification',
        style: AppTextTheme.bodyLarge,
      ),
      description: Text(
        message,
        style: AppTextTheme.bodyMedium.copyWith(color: AppColors.accent12),
      ),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 5),
      type: ToastificationType.info,
      icon: Icon(Bootstrap.bell_fill, size: 20),
      padding: EdgeInsets.all(10),
      showProgressBar: false,
    );
  }

  // info toast
  static void info(String message) {
    toastification.show(
      title: Text(
        'Alert',
        style: AppTextTheme.bodyLarge,
      ),
      description: Text(
        message,
        style: AppTextTheme.bodyMedium.copyWith(color: AppColors.accent12),
      ),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 5),
      type: ToastificationType.warning,
      style: ToastificationStyle.minimal,
      padding: EdgeInsets.all(10),
      showProgressBar: false,
    );
  }

  // success toast
  static void success(String message) {
    toastification.show(
      primaryColor: AppColors.blue,
      title: Text(
        'Succès',
        style: AppTextTheme.bodyLarge,
      ),
      description: Text(
        message,
        style: AppTextTheme.bodyMedium.copyWith(color: AppColors.accent12),
      ),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 5),
      type: ToastificationType.success,
      style: ToastificationStyle.minimal,
      padding: EdgeInsets.all(10),
      showProgressBar: false,
    );
  }

  // error toast
  static void error(String message) {
    toastification.show(
      title: Text(
        'Oups',
        style: AppTextTheme.bodyLarge,
      ),
      description: Text(
        message,
        style: AppTextTheme.bodyMedium.copyWith(color: AppColors.accent12),
      ),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 5),
      type: ToastificationType.error,
      style: ToastificationStyle.minimal,
      padding: EdgeInsets.all(10),
      showProgressBar: false,
    );
  }
}
