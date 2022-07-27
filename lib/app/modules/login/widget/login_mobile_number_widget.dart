import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:alhaddad_driver/app/widgets/textfields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../utils/config.dart';
import '../../../utils/utilities.dart';
import '../controllers/login_controller.dart';

class LoginMobileNumberWidget extends StatelessWidget {
  const LoginMobileNumberWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      keyboardType: TextInputType.phone,
      textInputFormatter: Utilities().phnNumberFormatter,
      maxLength: Config.maxNumLength,
      textColor: Colors.white,
      initialValue: controller.mobile,
      // prefixText: AppConstants.countryCode,
      prefix: const Icon(
        Icons.phone,
        color: AppColor.hintTextColor,
        size: 16,
      ),
      hint: LocaleKeys.mobileNo.tr,
      onChanged: (value) {
        controller.mobile = value;
      },
      textInputAction: TextInputAction.done,
      validator: (value) {
        return controller.isMobileNumberValid(value);
      },
      onSubmitted: (value) {
        CustomLogger().print("Mobile: $value", lineNumber: 49);
        controller.mobile = value;
        controller.onSubmitted();
      },
    );
  }
}
