import 'dart:convert';

import 'package:alhaddad_driver/app/modules/home/controllers/home_controller.dart';
import 'package:alhaddad_driver/app/modules/home/controllers/job_list_controller.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:alhaddad_driver/app/utils/themes_utils.dart';
import 'package:alhaddad_driver/app/widgets/bottomsheet/bottomsheet_with_style.dart';
import 'package:alhaddad_driver/app/widgets/buttons/solid_button_widget.dart';
import 'package:alhaddad_driver/app/widgets/toolbar/custom_container_toolbar.dart';
import 'package:alhaddad_driver/app/widgets/views/loaders/custom_loader_widget.dart';
import 'package:alhaddad_driver/generated/assets.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';

import '../controllers/job_detail_controller.dart';
import '../widgets/content_widgets.dart';
import '../widgets/failed_bottomsheet_content.dart';
import '../widgets/toolbar_items_widget.dart';

class JobDetailView extends GetView<JobDetailController> {
  const JobDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                            // MapUtils.openMap1(52.632247, -8.643179);
                            CustomLogger().print(
                                "Address Object: ${jsonEncode(controller.dataModel!.shippingAddress!)}",
                                lineNumber: 63);
                            MapsLauncher.launchQuery(controller
                                    .dataModel!.shippingAddress!.address1 ??
                                "");
                          }),
                  Expanded(child: ContentWidgets(controller: controller)),
                  if (Get.find<JobListController>().jobSelectedIndex.value !=
                      AppConstants.jobHistoryIndex)
                    Row(
                      children: [
                        if (controller.dataModel!.orderStatusId ==
                                AppConstants.shippedStatusId &&
                            controller.dataModel!.shippingStatusId ==
                                AppConstants.inTransitStatusId)
                          Expanded(
                            child: SolidButton(
                                outerPadding: const EdgeInsetsDirectional.only(
                                    top: 10, bottom: 10, start: 20, end: 5),
                                style: ThemeUtils().solidButtonStyle(
                                    backgroundColor: Colors.red),
                                title: LocaleKeys.deliveryFailed.tr,
                                onPressed: () {
                                  CustomBottomSheet.showCustomBottomSheet(
                                      FailedBottomSheetContent(
                                          controller: controller));
                                }),
                          ),
                        Expanded(
                          child: SolidButton(
                              outerPadding: EdgeInsetsDirectional.only(
                                  top: 10,
                                  bottom: 10,
                                  start: (controller.dataModel!.orderStatusId ==
                                              AppConstants.shippedStatusId &&
                                          controller.dataModel!
                                                  .shippingStatusId ==
                                              AppConstants.inTransitStatusId)
                                      ? 5
                                      : 20,
                                  end: 20),
                              title: controller.buttonTitleText(),
                              onPressed: () {
                                controller.buttonPressed();
                              }),
                        )
                      ],
                    ),
                ],
              ),
      ),
    );
  }
}
