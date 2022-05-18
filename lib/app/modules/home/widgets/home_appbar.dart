import 'package:alhaddad_driver/app/widgets/toolbar/custom_container_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeAppbar extends StatelessWidget {
  HomeAppbar({
    Key? key,
    this.showCustomBackgroundImage = true,
  }) : super(key: key);
  final HomeController controller = Get.find<HomeController>();
  final bool showCustomBackgroundImage;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomContainerToolbar(
          showCustomBackgroundImage: showCustomBackgroundImage,
          isHasLeading: true,
          onPressedLeading: () {
            controller.onBackPressed();
          },
          title: controller.toolbarTitle.value),
    );
  }
}
