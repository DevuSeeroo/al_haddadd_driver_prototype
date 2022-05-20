import 'package:alhaddad_driver/app/widgets/textfields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../utils/app_color.dart';
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
      keyboardType:
          const TextInputType.numberWithOptions(signed: false, decimal: false),
      textInputFormatter: Utilities().numberFormatter,
      maxLength: Config.minMaxNumLength,
      textColor: Colors.white,
      prefix: const Icon(
        Icons.phone,
        color: AppColor.hintTextColor,
        size: 16,
      ),
      hint: LocaleKeys.mobileNo.tr,
      onChanged: (value) {},
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return LocaleKeys.mobileNoShouldntBeEmpty.tr;
        } else if (value.trim().length < Config.minMaxNumLength) {
          return LocaleKeys.phoneErrorValid.tr;
        } else {
          return null;
        }
      },
      onSubmitted: (value) {
        controller.onSubmitted();
      },
    );
  }
}
