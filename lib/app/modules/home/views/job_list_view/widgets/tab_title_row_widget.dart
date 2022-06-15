import 'package:alhaddad_driver/app/modules/home/controllers/job_list_controller.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'horizontal_divder_widget.dart';
import 'tab_title_text.dart';

class TabTitleRowWidget extends StatelessWidget {
  const TabTitleRowWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final JobListController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Obx(() => TabTitleText(
              title: LocaleKeys.assigned.tr,
              isSelected: controller.jobSelectedIndex.value ==
                  AppConstants.jobAssignedIndex,
              onTap: () {
                controller.setJobSelectedIndex(AppConstants.jobAssignedIndex);
              },
            )),
        const HorizontalDivider(),
        Obx(() => TabTitleText(
              title: LocaleKeys.picked.tr,
              isSelected: controller.jobSelectedIndex.value ==
                  AppConstants.jobPickedIndex,
              onTap: () {
                controller.setJobSelectedIndex(AppConstants.jobPickedIndex);
              },
            )),
        const HorizontalDivider(),
        Obx(() => TabTitleText(
              title: LocaleKeys.history.tr,
              isSelected: controller.jobSelectedIndex.value ==
                  AppConstants.jobHistoryIndex,
              onTap: () {
                controller.setJobSelectedIndex(AppConstants.jobHistoryIndex);
              },
            )),
      ],
    );
  }
}
