import 'dart:async';

import 'package:alhaddad_driver/app/utils/app_storage_keys.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

import '../../../utils/navigation_utils.dart';

class SplashController extends GetxController {
  final versionNumber = "1.0.0".obs;
  @override
  void onInit() {
    super.onInit();
    CustomLogger().print("onInit", lineNumber: 15);
    getVersionNumber();
    Timer(
        const Duration(seconds: 3),
        () => {
              // moveToHomeScreen()
              AppStorageKeys().readLogInStatus()
                  ? moveToHomeScreen()
                  : moveToLoginScreen(),
              CustomLogger().print(
                  'in splash : ${AppStorageKeys().readLogInStatus()}',
                  lineNumber: 26),
              CustomLogger().print(
                  'in splash : ${AppStorageKeys().readUserId()}',
                  lineNumber: 29)
            });
  }

  Future getVersionNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionName = packageInfo.version;
    versionNumber.value = versionName;
  }

  moveToHomeScreen() {
    // Get.offAllNamed(Routes.DASHBOARD);
    NavigationUtils().callHome(isNeedBackStack: false);
  }

  moveToLoginScreen() {
    NavigationUtils().exitToLogin(className: "className");
  }
}
