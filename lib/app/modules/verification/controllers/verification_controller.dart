import 'package:alhaddad_driver/app/modules/login/models/send_otp_params.dart';
import 'package:alhaddad_driver/app/modules/login/providers/login_provider.dart';
import 'package:alhaddad_driver/app/modules/verification/models/verify_otp_params.dart';
import 'package:alhaddad_driver/app/modules/verification/providers/verification_provider.dart';
import 'package:alhaddad_driver/app/utils/api_exception_util.dart';
import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:alhaddad_driver/app/utils/app_params_key.dart';
import 'package:alhaddad_driver/app/utils/app_storage_keys.dart';
import 'package:alhaddad_driver/app/utils/date_utlis.dart';
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
  int seconds = 120;
  RxBool isShowResendOtp = false.obs;

  @override
  void onInit() {
    super.onInit();
    verifyOtpParams.phoneNumber = Get.parameters[AppParamsKey.paramPhone];
    seconds =
        int.parse(Get.parameters[AppParamsKey.paramExpireInSeconds] ?? "120");
    seconds = 5;
  }

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

  void sendOtpMethod() {
    apiCalling(true);
    LoginProvider()
        .sendOtpResponse(
            params: SendOtpParams('${verifyOtpParams.phoneNumber}'))
        .then((response) {
      if (response.getException != null) {
        ApiExceptionUtils().apiException(
            error: response.getException, className: className, lineNumber: 72);
      } else if (response.data?.apiResponseModel?.status ?? false) {
        seconds = CustomDateUtils().differenceBetweenTwoStringDates(
            fDate: response.data?.createdOnUTC ?? "",
            sDate: response.data?.expiryOnUTC ?? "");
        isShowResendOtp(false);
        CustomSnackBar.showSuccessSnackBar(
            LocaleKeys.success.tr,
            "${response.data?.apiResponseModel?.message} ${LocaleKeys.otp.tr}"
            " - ${response.data?.otp}",
            backgroundColor: Colors.white,
            textColor: AppColor.colorPrimary);
      } else {
        CustomSnackBar.showErrorSnackBar(
            LocaleKeys.error.tr,
            response.data?.apiResponseModel?.message ??
                LocaleKeys.somethingWentWrong.tr);
      }
      apiCalling(false);
    });
  }
}
