import 'package:alhaddad_driver/app/modules/home/controllers/home_controller.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/utils/map_utils.dart';
import 'package:alhaddad_driver/app/widgets/buttons/solid_button_widget.dart';
import 'package:alhaddad_driver/app/widgets/toolbar/custom_container_toolbar.dart';
import 'package:alhaddad_driver/app/widgets/views/loaders/custom_loader_widget.dart';
import 'package:alhaddad_driver/generated/assets.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/job_detail_controller.dart';
import '../widgets/content_widgets.dart';
import '../widgets/toolbar_items_widget.dart';

class JobDetailView extends GetView<JobDetailController> {
  const JobDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const CustomLoaderWidget()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Get.find<HomeController>().selectedIndex.value ==
                              AppConstants.historyIndex ||
                          (controller.data!.orderStatus ==
                                  AppConstants.jobNotStarted ||
                              controller.data!.orderStatus ==
                                  AppConstants.jobReached)
                      ? ToolbarItemsWidget(
                          jobId: controller.data!.jobId ?? "",
                          paymentMethod: controller.data!.paymentMethod ?? "",
                          totalAmount: controller.data!.total.toString(),
                        )
                      : CustomContainerToolbar(
                          showCustomBackgroundImage: true,
                          isHasLeading: true,
                          onPressedLeading: () {
                            Get.back();
                          },
                          title: controller.data!.orderStatus ==
                                  AppConstants.jobPickedUp
                              ? LocaleKeys.orderPickedUp.tr
                              : controller.data!.orderStatus ==
                                      AppConstants.jobOnGoing
                                  ? LocaleKeys.onTheWay.tr
                                  : "",
                          isHasTrailing: controller.data!.orderStatus ==
                                  AppConstants.jobPickedUp ||
                              controller.data!.orderStatus ==
                                  AppConstants.jobOnGoing,
                          isTrailingSvg: true,
                          trailingIcon: Assets.iconsLocation,
                          onPressedTrailing: () {
                            MapUtils.openMap1(52.632247, -8.643179);
                          }),
                  Expanded(child: ContentWidgets(controller: controller)),
                  if (Get.find<HomeController>().selectedIndex.value ==
                      AppConstants.homeIndex)
                    SolidButton(
                        outerPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        title: controller.buttonTitleText(),
                        onPressed: () {
                          controller.buttonPressed();
                        })
                ],
              ),
      ),
    );
  }
}
