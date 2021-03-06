import 'package:alhaddad_driver/app/modules/home/controllers/job_list_controller.dart';
import 'package:alhaddad_driver/app/modules/job_detail/controllers/job_detail_controller.dart';
import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/utils/date_utlis.dart';
import 'package:alhaddad_driver/generated/assets.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'job_detail_widget.dart';
import 'product_list_widget.dart';

class ContentWidgets extends StatelessWidget {
  const ContentWidgets({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final JobDetailController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          Get.find<JobListController>().jobSelectedIndex.value ==
                      AppConstants.jobHistoryIndex ||
                  controller.dataModel!.driverShippingStatusId ==
                      AppConstants.shippingDriverAssignedStatusId
              ? TitleAndListWidget(controller: controller)
              : StatusImageWidget(
                  asset: controller.dataModel!.driverShippingStatusId ==
                          AppConstants.shippingShippedStatusId
                      ? Assets.imagesOrderPickedUp
                      : Assets.imagesDeliveryOnTheWay),
          //Todo: check later
          CustomDateUtils().dateToDisplay(
                      apiDate: controller.dataModel!.shipments != null &&
                              controller.dataModel!.shipments!.isNotEmpty
                          ? controller.dateValueToShow()
                          : "") !=
                  null
              ? JobDetailWidget(
                  iconsData: Icons.calendar_today_outlined,
                  title: controller.dateTitle(),
                  titleValue: CustomDateUtils().dateToDisplay(
                          apiDate: controller.dataModel!.shipments != null &&
                                  controller.dataModel!.shipments!.isNotEmpty
                              ? controller.dateValueToShow()
                              : "") ??
                      "",
                  titleValueColor: AppColor.jobDetailBlueColor,
                  titleValueSize: 14,
                  titleValueFontWeight: FontWeight.w600,
                )
              : Container(),
          JobDetailWidget(
            iconsData: Icons.person,
            title: LocaleKeys.name.tr,
            titleValue:
                "${controller.dataModel!.shippingAddress!.firstName ?? " "} ${controller.dataModel!.shippingAddress!.lastName ?? " "}",
            titleValueSize: 14,
            titleValueFontWeight: FontWeight.w600,
          ),
          if (controller.dataModel!.shippingAddress!.company != null &&
              controller.dataModel!.shippingAddress!.company!.isNotEmpty)
            JobDetailWidget(
              iconsData: Icons.people,
              title: LocaleKeys.companyName.tr,
              titleValue: controller.dataModel!.shippingAddress!.company ?? "",
              titleValueSize: 14,
              titleValueFontWeight: FontWeight.w600,
            ),
          JobDetailWidget(
            iconsData: Icons.credit_card,
            title: LocaleKeys.address.tr,
            titleValue:
                "${controller.dataModel!.shippingAddress!.address1 ?? " "} "
                "${controller.dataModel!.shippingAddress!.address2 != null && controller.dataModel!.shippingAddress!.address2!.isNotEmpty ? ", " : ""}"
                "${controller.dataModel!.shippingAddress!.address2 ?? " "}\n"
                "${controller.dataModel!.shippingAddress!.city ?? " "}, "
                "${controller.dataModel!.shippingAddress!.stateProvinceName ?? " "}, ${controller.dataModel!.shippingAddress!.countryName ?? " "}\n"
                "${controller.dataModel!.shippingAddress!.zipPostalCode != null && controller.dataModel!.shippingAddress!.zipPostalCode!.isNotEmpty ? "Pin: " : ""}"
                "${controller.dataModel!.shippingAddress!.zipPostalCode ?? " "}",
            titleValueSize: 14,
          ),
          JobDetailWidget(
            iconsData: Icons.phone_android,
            title: LocaleKeys.mobile.tr,
            titleValue:
                controller.dataModel!.shippingAddress!.phoneNumber ?? "",
            titleValueSize: 14,
          ),
          JobDetailWidget(
            iconsData: Icons.settings,
            title: LocaleKeys.status.tr,
            titleValue: Get.find<JobListController>().statusMessageNew(
                controller.dataModel!.driverShippingStatusId ??
                    AppConstants.shippingDriverAssignedStatusId),
            titleValueSize: 14,
            titleValueFontWeight: FontWeight.w600,
            titleValueColor: AppColor().getJobBasedColor(
                controller.dataModel!.driverShippingStatusId ??
                    AppConstants.shippingDriverAssignedStatusId),
          ),
          // JobDetailWidget(
          //   iconsData: Icons.phone_android,
          //   title: LocaleKeys.alternateMobile.tr,
          //   titleValue: controller.data!.alternateMobile ?? "",
          //   titleValueSize: 14,
          // ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class StatusImageWidget extends StatelessWidget {
  const StatusImageWidget({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        child: Image.asset(asset));
  }
}

class TitleAndListWidget extends StatelessWidget {
  const TitleAndListWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final JobDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40.0, bottom: 10, top: 10),
          child: Text(
            LocaleKeys.orderDetails.tr,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ProductListWidget(controller: controller),
      ],
    );
  }
}
