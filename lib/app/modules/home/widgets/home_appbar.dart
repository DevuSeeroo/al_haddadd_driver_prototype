import 'package:alhaddad_driver/app/widgets/toolbar/custom_container_toolbar.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeAppbar extends StatelessWidget {
  HomeAppbar({
    Key? key,
    this.showCustomBackgroundImage = true,
    this.onTrailingPressed,
  }) : super(key: key);
  final HomeController controller = Get.find<HomeController>();
  final bool showCustomBackgroundImage;
  final Function? onTrailingPressed;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomContainerToolbar(
          showCustomBackgroundImage: showCustomBackgroundImage,
          isHasLeading: true,
          onPressedLeading: () {
            controller.onBackPressed();
          },
          title: controller.toolbarTitle.value,
          isHasTrailing: controller.toolbarTitle.value == LocaleKeys.jobs.tr,
          trailingIcon: Icons.calendar_month,
          trailingWidgetColor: Colors.white,
          onPressedTrailing: () {
            onTrailingPressed!();
          }),
    );
  }
}
