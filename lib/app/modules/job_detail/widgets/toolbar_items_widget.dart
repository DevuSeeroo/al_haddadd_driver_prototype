import 'package:alhaddad_driver/app/widgets/toolbar/custom_container_toolbar.dart';
import 'package:alhaddad_driver/generated/assets.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'toolbar_job_details_widget.dart';

class ToolbarItemsWidget extends StatelessWidget {
  const ToolbarItemsWidget({
    Key? key,
    required this.jobId,
    required this.paymentMethod,
    required this.totalAmount,
  }) : super(key: key);

  final String jobId;
  final String paymentMethod;
  final String totalAmount;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      ),
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 30,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
          image: DecorationImage(
              image: AssetImage(Assets.imagesProfileBg), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            CustomContainerToolbar(
              showCustomBackgroundImage: false,
              onPressedLeading: () {
                Get.back(closeOverlays: true);
              },
              title: LocaleKeys.jobDetails.tr,
            ),
            const SizedBox(height: 20),
            ToolbarJobDetailsWidget(
                icon: Icons.shopping_bag_outlined,
                title: LocaleKeys.jobId.tr,
                value: jobId),
            const SizedBox(height: 5),
            ToolbarJobDetailsWidget(
              icon: Icons.currency_pound,
              title: LocaleKeys.paymentMethod.tr,
              value: paymentMethod,
              valueColor: Colors.yellow,
            ),
            const SizedBox(height: 5),
            ToolbarJobDetailsWidget(
              title: LocaleKeys.total.tr,
              titleSize: 16,
              value: totalAmount,
              valueSize: 16,
              valueWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
