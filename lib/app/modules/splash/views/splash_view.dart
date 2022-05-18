import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../../../utils/config.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Image(
              image: AssetImage(Assets.iconsSplashLogo),
              width: 150,
              height: 150,
            ),
          ),
          Visibility(
            visible: controller.versionNumber.value.isNotEmpty,
            child: Text(
              "V ${controller.versionNumber.value}",
              style: const TextStyle(
                  color: AppColor.colorPrimary,
                  fontSize: Config.textNormalSize,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    ));
  }
}
