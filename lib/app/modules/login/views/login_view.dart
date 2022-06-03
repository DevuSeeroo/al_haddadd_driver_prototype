import 'package:alhaddad_driver/app/widgets/text/heading_text.dart';
import 'package:alhaddad_driver/app/widgets/views/loaders/loading_view.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/background/login_bg_widget.dart';
import '../controllers/login_controller.dart';
import '../widget/login_mobile_number_widget.dart';
import '../widget/login_next_button_widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingView(
        isLoading: controller.apiCalling,
        isShowBackground: true,
        child: LoginBackgroundWidget(
            topSpace: 50,
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeadingText(text: LocaleKeys.login.tr),
                  const SizedBox(height: 40),
                  LoginMobileNumberWidget(controller: controller),
                  const SizedBox(height: 30),
                  LoginNextButtonWidget(controller: controller)
                ],
              ),
            )),
      ),
    );
  }
}
