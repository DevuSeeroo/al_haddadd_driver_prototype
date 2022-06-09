import 'package:alhaddad_driver/app/modules/home/controllers/home_controller.dart';
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
          Get.find<HomeController>().homeSelectedIndex.value ==
                      AppConstants.historyIndex ||
                  controller.dataModel!.orderStatusId ==
                      AppConstants.processingStatusId
              ? TitleAndListWidget(controller: controller)
              : StatusImageWidget(
                  asset: controller.dataModel!.orderStatusId ==
                          AppConstants.shippedStatusId
                      ? Assets.imagesOrderPickedUp
                      : Assets.imagesDeliveryOnTheWay),
          JobDetailWidget(
            iconsData: Icons.calendar_today_outlined,
            title: LocaleKeys.dateAndTime.tr,
            titleValue: CustomDateUtils()
                .dateToDisplay(apiDate: controller.dataModel!.createdOn ?? ""),
            titleValueColor: AppColor.jobDetailBlueColor,
            titleValueSize: 14,
            titleValueFontWeight: FontWeight.w600,
          ),
          JobDetailWidget(
            iconsData: Icons.credit_card,
            title: LocaleKeys.address.tr,
            titleValue:
                "${controller.dataModel!.shippingAddress!.firstName ?? " "} ${controller.dataModel!.shippingAddress!.lastName ?? " "}",
            titleValueSize: 15,
            titleValueFontWeight: FontWeight.w600,
            subTitle: "",
            subtitleValue:
                "${controller.dataModel!.shippingAddress!.address1 ?? " "}",
            subtitleValueSize: 14,
          ),
          JobDetailWidget(
            iconsData: Icons.phone_android,
            title: LocaleKeys.mobile.tr,
            titleValue:
                controller.dataModel!.shippingAddress!.phoneNumber ?? "",
            titleValueSize: 14,
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
