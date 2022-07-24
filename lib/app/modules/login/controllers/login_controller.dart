import 'package:alhaddad_driver/app/modules/login/models/send_otp_params.dart';
import 'package:alhaddad_driver/app/modules/login/providers/login_provider.dart';
import 'package:alhaddad_driver/app/utils/api_exception_util.dart';
import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:alhaddad_driver/app/utils/navigation_utils.dart';
import 'package:alhaddad_driver/app/utils/snackbar_utils.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/custom_logger.dart';
import '../../../utils/date_utlis.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String className = "LoginController";
  LoginProvider provider = LoginProvider();
  String? mobile = "";
  RxBool apiCalling = false.obs;
  @override
  void onInit() {
    super.onInit();
    mobile = "+966123456798";
  }

  @override
  void onClose() {}

  String? isMobileNumberValid(String? value) {
    if (value!.trim().isEmpty) {
      return LocaleKeys.mobileNoShouldntBeEmpty.tr;
    }
    // else if (!value.trim().isNumericOnly) {
    //   return "Only numbers are allowed";
    // }
    // else if (value.trim().length != Config.maxNumLength) {
    //   return LocaleKeys.phoneErrorValid.tr;
    // } else if (value.trim().contains("+")) {
    //   if (value.substring(1) != "+") {
    //     return LocaleKeys.phoneErrorValid.tr;
    //   } else if (value.substring(1).contains("+")) {
    //     return LocaleKeys.phoneErrorValid.tr;
    //   }
    // }
    else {
      return null;
    }
  }

  onSubmitted() {
    if (formKey.currentState!.validate()) {
      sendOtpMethod();
    } else {
      CustomLogger().print("Not valid", className: className, lineNumber: 33);
    }
  }

  void sendOtpMethod() {
    apiCalling(true);
    // String mobileNumber='${AppConstants.countryCode}$mobile';
    String mobileNumber = '$mobile';
    provider
        .sendOtpResponse(params: SendOtpParams(mobileNumber))
        .then((response) {
      if (response.getException != null) {
        ApiExceptionUtils().apiException(
            error: response.getException, className: className, lineNumber: 47);
      } else if (response.data?.apiResponseModel?.status ?? false) {
        NavigationUtils().callVerificationScreen(
            mobile: mobileNumber,
            expireInSeconds: CustomDateUtils().differenceBetweenTwoStringDates(
                fDate: response.data?.createdOnUTC ?? "",
                sDate: response.data?.expiryOnUTC ?? ""));
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
