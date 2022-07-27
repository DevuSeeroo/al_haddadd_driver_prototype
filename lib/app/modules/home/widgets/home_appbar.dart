import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:alhaddad_driver/app/widgets/toolbar/custom_container_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeAppbar extends StatelessWidget {
  HomeAppbar({
    Key? key,
    this.showCustomBackgroundImage = true,
    this.onTrailingPressed,
    this.enableBackPressed = true,
  }) : super(key: key);
  final HomeController controller = Get.find<HomeController>();
  final bool showCustomBackgroundImage;
  final Function? onTrailingPressed;
  final bool enableBackPressed;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomContainerToolbar(
        showCustomBackgroundImage: showCustomBackgroundImage,
        isHasLeading: true,
        onPressedLeading: () {
          if (enableBackPressed) {
            controller.onBackPressed();
          } else {
            CustomLogger().print("backPress disabled", lineNumber: 30);
          }
        },
        title: controller.toolbarTitle.value,
      ),
    );
  }
}
