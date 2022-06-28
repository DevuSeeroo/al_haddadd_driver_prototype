import 'package:alhaddad_driver/app/modules/verification/widgets/verification_continue_button_widget.dart';
import 'package:alhaddad_driver/app/utils/themes_utils.dart';
import 'package:alhaddad_driver/app/widgets/buttons/solid_button_widget.dart';
import 'package:alhaddad_driver/app/widgets/views/loaders/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/background/login_bg_widget.dart';
import '../../../widgets/text/heading_text.dart';
import '../../../widgets/toolbar/custom_appbar.dart';
import '../controllers/verification_controller.dart';
import '../widgets/count_down_timer.dart';
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
      body: LoadingView(
        isLoading: controller.apiCalling,
        isShowBackground: true,
        child: LoginBackgroundWidget(
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
              VerificationContinueButtonWidget(controller: controller),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.didntGetOtp.tr,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Obx(() => !controller.isShowResendOtp.value
                      ? CountDownTimer(
                          secondsRemaining: controller.seconds,
                          whenTimeExpires: () {
                            controller.isShowResendOtp(true);
                          },
                          countDownTimerStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            height: 1.2,
                          ),
                        )
                      : SolidButton(
                          title: LocaleKeys.resendOtp.tr,
                          titleColor: AppColor.colorPrimary,
                          onPressed: () {
                            controller.sendOtpMethod();
                          },
                          style: ThemeUtils()
                              .buttonThemeSettings(
                                backgroundColor: Colors.white,
                              )
                              .style,
                        )),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
