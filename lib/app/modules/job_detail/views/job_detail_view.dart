import 'package:alhaddad_driver/app/modules/home/controllers/home_controller.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/utils/map_utils.dart';
import 'package:alhaddad_driver/app/widgets/buttons/solid_button_widget.dart';
import 'package:alhaddad_driver/app/widgets/toolbar/custom_container_toolbar.dart';
import 'package:alhaddad_driver/app/widgets/views/loaders/custom_loader_widget.dart';
import 'package:alhaddad_driver/generated/assets.dart';
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
                  Get.find<HomeController>().homeSelectedIndex.value ==
                              AppConstants.historyIndex ||
                          (controller.dataModel!.orderStatusId ==
                                  AppConstants.processingStatusId ||
                              controller.dataModel!.orderStatusId ==
                                  AppConstants.completedStatusId)
                      ? ToolbarItemsWidget(
                          jobId: "${controller.dataModel!.id}",
                          paymentMethod:
                              controller.dataModel!.paymentMethod ?? "",
                          totalAmount:
                              controller.dataModel!.orderTotal.toString(),
                        )
                      : CustomContainerToolbar(
                          showCustomBackgroundImage: true,
                          isHasLeading: true,
                          onPressedLeading: () {
                            Get.back();
                          },
                          title: controller.toolbarTitleText(),
                          isHasTrailing: controller.dataModel!.orderStatusId ==
                                  AppConstants.shippedStatusId ||
                              controller.dataModel!.orderStatusId ==
                                  AppConstants.inTransitStatusId,
                          isTrailingSvg: true,
                          trailingIcon: Assets.iconsLocation,
                          onPressedTrailing: () {
                            MapUtils.openMap1(52.632247, -8.643179);
                          }),
                  Expanded(child: ContentWidgets(controller: controller)),
                  if (Get.find<HomeController>().homeSelectedIndex.value ==
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
