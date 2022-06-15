import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet {
  static void showCustomBottomSheet(Widget child,
      {bool isDismissible = false}) {
    Get.bottomSheet(child,
        backgroundColor: Colors.white,
        isDismissible: isDismissible,
        enableDrag: isDismissible,
        isScrollControlled: true,
        elevation: 10.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          side: BorderSide(
              color: Colors.white, style: BorderStyle.solid, width: 2.0),
        ));
  }

  static void showCustomBottomSheetWithMargin(
    Widget child, {
    bool isDismissible = false,
    bool enableDrag = true,
  }) {
    Get.bottomSheet(
      IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
          child: child,
        ),
      ),
      isDismissible: isDismissible,
      isScrollControlled: true,
      enableDrag: enableDrag,
      elevation: 10.0,
    );
  }
}
