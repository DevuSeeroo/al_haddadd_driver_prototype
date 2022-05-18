import 'package:alhaddad_driver/app/modules/verification/widgets/verification_continue_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/background/login_bg_widget.dart';
import '../../../widgets/text/heading_text.dart';
import '../../../widgets/toolbar/custom_appbar.dart';
import '../controllers/verification_controller.dart';
import '../widgets/pin_widget.dart';

class VerificationView extends GetView<VerificationController> {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        backgroundColor: Colors.white,
        isHasLeading: true,
        leadingWidgetColor: AppColor.colorPrimary,
        onPressedLeading: () {
          Get.back();
        },
      ),
      body: LoginBackgroundWidget(
          child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeadingText(text: LocaleKeys.verification.tr),
            const SizedBox(height: 40),
            PinWidget(
              controller: controller,
            ),
            const SizedBox(height: 30),
            VerificationContinueButtonWidget(controller: controller)
          ],
        ),
      )),
    );
  }
}
