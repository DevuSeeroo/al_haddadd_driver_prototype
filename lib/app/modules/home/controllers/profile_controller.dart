import 'package:alhaddad_driver/app/modules/home/providers/profile_provider.dart';
import 'package:alhaddad_driver/app/utils/api_exception_util.dart';
import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:alhaddad_driver/app/utils/app_storage_keys.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:alhaddad_driver/app/utils/navigation_utils.dart';
import 'package:alhaddad_driver/app/utils/snackbar_utils.dart';
import 'package:alhaddad_driver/app/widgets/bottomsheet/bottomsheet_content/title_subtitle_bottomsheet_content.dart';
import 'package:alhaddad_driver/app/widgets/bottomsheet/bottomsheet_with_style.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final RxString name = "".obs;

  String className = "ProfileController";
  ProfileProvider provider = ProfileProvider();
  RxBool apiCalling = false.obs;
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    viewProfileDetails();
  }

  viewProfileDetails() {
    provider.viewProfileData().then((response) {
      if (response.getException != null) {
        ApiExceptionUtils().apiException(
            error: response.getException,
            className: className,
            lineNumber: 131);
        isLoading(false);
      } else {
        name.value = ((response.data!.firstName ?? "") +
            (" ") +
            (response.data!.lastName ?? ""));
        CustomLogger().print(name.value, className: className, lineNumber: 39);
        isLoading(false);
      }
    });
  }

  void onLogoutPressed() {
    CustomBottomSheet.showCustomBottomSheetWithMargin(
        TitleSubtitleBottomSheetContent(
      title: "${LocaleKeys.logout.tr} !",
      subtitle: LocaleKeys.logoutMessage.tr,
      negativeButtonPressed: () {
        Get.back();
      },
      positiveButtonPressed: () {
        logoutApiMethod();
      },
    ));
  }

  void logoutApiMethod() {
    apiCalling(true);
    provider.logoutUser().then((response) {
      if (response.getException != null) {
        ApiExceptionUtils().apiException(
            error: response.getException, className: className, lineNumber: 44);
      } else if (response.data != null) {
        AppStorageKeys().clearAllDetails();
        NavigationUtils().exitToLogin(className: className);
        CustomSnackBar.showSuccessSnackBar(
            LocaleKeys.logout.tr, LocaleKeys.success.tr,
            backgroundColor: Colors.white, textColor: AppColor.colorPrimary);
      } else {
        CustomSnackBar.showErrorSnackBar(LocaleKeys.error.tr,
            response.data?.message ?? LocaleKeys.somethingWentWrong.tr);
      }
      apiCalling(false);
    });
  }
}
