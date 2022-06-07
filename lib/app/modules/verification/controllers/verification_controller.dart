import 'package:alhaddad_driver/app/modules/verification/models/verify_otp_params.dart';
import 'package:alhaddad_driver/app/modules/verification/providers/verification_provider.dart';
import 'package:alhaddad_driver/app/utils/api_exception_util.dart';
import 'package:alhaddad_driver/app/utils/app_params_key.dart';
import 'package:alhaddad_driver/app/utils/app_storage_keys.dart';
import 'package:alhaddad_driver/app/utils/snackbar_utils.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/custom_logger.dart';
import '../../../utils/navigation_utils.dart';

class VerificationController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final String className = "VerificationController";
  String? pin;
  RxString error = "".obs;
  VerifyOtpParams verifyOtpParams = VerifyOtpParams();
  VerificationProvider verificationProvider = VerificationProvider();
  RxBool apiCalling = false.obs;
  @override
  void onInit() {
    super.onInit();
    verifyOtpParams.phoneNumber = Get.parameters[AppParamsKey.paramPhone];
  }

  @override
  void onClose() {}

  onSubmitted() {
    if (formKey.currentState!.validate() && error.value.isEmpty) {
      verifyOtp();
    } else {
      CustomLogger().print("Not valid", className: className, lineNumber: 36);
    }
  }

  verifyOtp() {
    verifyOtpParams.otp = pin;
    apiCalling(true);
    verificationProvider.verifyOtp(params: verifyOtpParams).then((response) {
      if (response.getException != null) {
        ApiExceptionUtils().apiException(
            error: response.getException, className: className, lineNumber: 44);
      } else if (response.data?.status ?? false) {
        AppStorageKeys().writeLogInStatus(true);
        AppStorageKeys().writeUserToken(response.data?.token);
        AppStorageKeys().writeUserId(response.data?.userId);
        NavigationUtils().callHome();
      } else {
        CustomSnackBar.showErrorSnackBar(LocaleKeys.error.tr,
            response.data?.message ?? LocaleKeys.somethingWentWrong.tr);
      }
      apiCalling(false);
    });
  }
}
