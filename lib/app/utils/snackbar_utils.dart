import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_color.dart';
import 'config.dart';

class CustomSnackBar {
  static void showErrorSnackBar(String title, String message,
      {String className = '', String calledFrom = '', int lineNumber = 0}) {
    if (className.isNotEmpty && lineNumber != 0) {
      log('Error occured from className: $className, ${calledFrom.isNotEmpty ? 'CalledFrom: '
              '$calledFrom' : ''}'
          ' pageNumber $lineNumber');
    }
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        maxWidth: kIsWeb ? Config.kWebWidth : double.infinity,
        margin: const EdgeInsets.all(16));
  }

  static void showSuccessSnackBar(
    String title,
    String message, {
    Color? backgroundColor,
    Color? textColor,
  }) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor ?? AppColor.colorPrimary,
        maxWidth: kIsWeb ? Config.kWebWidth : double.infinity,
        colorText: textColor ?? Colors.white,
        margin: const EdgeInsets.all(16));
  }

  static void showSuccessSnackBarWithButton(
      {required String title,
      required String message,
      required String buttonTitle,
      required Function onPressedButton}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.colorPrimary,
        maxWidth: kIsWeb ? Config.kWebWidth : double.infinity,
        colorText: Colors.white,
        margin: const EdgeInsets.all(14),
        isDismissible: false,
        mainButton: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: () {
            onPressedButton();
          },
          child: Text(
            buttonTitle,
            style: const TextStyle(color: AppColor.colorPrimary),
          ),
        ));
  }

  static void showIncompleteSnackBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.colorPrimary,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16));
  }
}
