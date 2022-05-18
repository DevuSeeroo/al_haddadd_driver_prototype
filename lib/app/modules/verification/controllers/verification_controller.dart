import 'package:alhaddad_driver/app/utils/app_storage_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/custom_logger.dart';
import '../../../utils/navigation_utils.dart';

class VerificationController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final String className = "VerificationController";
  String? pin;
  RxString error = "".obs;
  @override
  void onClose() {}

  onSubmitted() {
    if (formKey.currentState!.validate() && error.value.isEmpty) {
      AppStorageKeys().writeLogInStatus(true);
      NavigationUtils().callHome();
    } else {
      CustomLogger().print("Not valid", className: className, lineNumber: 29);
    }
  }
}
