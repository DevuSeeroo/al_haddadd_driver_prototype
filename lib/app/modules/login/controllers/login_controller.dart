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

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String className = "LoginController";
  LoginProvider provider = LoginProvider();
  String? mobile = "";
  RxBool apiCalling = false.obs;
  @override
  void onInit() {
    super.onInit();
    mobile = "123456798";
  }

  @override
  void onClose() {}

  onSubmitted() {
    if (formKey.currentState!.validate()) {
      sendOtpMethod();
    } else {
      CustomLogger().print("Not valid", className: className, lineNumber: 38);
    }
  }

  void sendOtpMethod() {
    apiCalling(true);
    provider
        .sendOtpResponse(params: SendOtpParams('+966$mobile'))
        .then((response) {
      if (response.getException != null) {
        ApiExceptionUtils().apiException(
            error: response.getException, className: className, lineNumber: 47);
      } else if (response.data?.apiResponseModel?.status ?? false) {
        NavigationUtils().callVerificationScreen('+966$mobile');
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
