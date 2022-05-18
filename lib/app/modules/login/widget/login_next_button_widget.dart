import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../utils/app_color.dart';
import '../../../utils/themes_utils.dart';
import '../../../widgets/buttons/solid_button_widget.dart';
import '../controllers/login_controller.dart';

class LoginNextButtonWidget extends StatelessWidget {
  const LoginNextButtonWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;
  final String className = "LoginNextButtonWidget";

  @override
  Widget build(BuildContext context) {
    return SolidButton(
      title: LocaleKeys.next.tr,
      titleColor: AppColor.colorPrimary,
      onPressed: () {
        controller.onSubmitted();
      },
      style: ThemeUtils()
          .buttonThemeSettings(
            backgroundColor: Colors.white,
          )
          .style,
    );
  }
}
