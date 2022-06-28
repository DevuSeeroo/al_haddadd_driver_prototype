import 'package:alhaddad_driver/app/utils/app_params_key.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class NavigationUtils {
  void exitToDashboard() {
    Get.offNamedUntil(Routes.HOME, (route) => false);
  }

  void exitToLogin({required String className}) {
    CustomLogger().print("exitToLogin", className: className, lineNumber: 13);
    Get.offNamedUntil(Routes.LOGIN, (route) => false);
  }

  void callHome({bool isNeedBackStack = false}) {
    if (isNeedBackStack) {
      Get.toNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.HOME);
    }
  }

  void callVerificationScreen(
      {required String mobile, required int expireInSeconds}) {
    Get.toNamed(Routes.VERIFICATION, parameters: {
      AppParamsKey.paramPhone: mobile,
      AppParamsKey.paramExpireInSeconds: expireInSeconds.toString()
    });
  }

  Future<bool> callJobDetailScreen({required String id}) async {
    await Get.toNamed(Routes.JOB_DETAIL, parameters: {"id": id});
    return true;
  }

  void callJobCompletedScreen() {
    Get.toNamed(Routes.JOB_COMPLETED);
  }
}
