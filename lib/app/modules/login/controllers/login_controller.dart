import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/custom_logger.dart';
import '../../../utils/navigation_utils.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String className = "LoginController";
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onSubmitted() {
    if (formKey.currentState!.validate()) {
      NavigationUtils().callVerificationScreen();
    } else {
      CustomLogger().print("Not valid", className: className, lineNumber: 29);
    }
  }
}
