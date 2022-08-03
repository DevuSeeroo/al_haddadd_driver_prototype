import 'dart:convert';

import 'package:alhaddad_driver/app/modules/home/controllers/job_list_controller.dart';
import 'package:alhaddad_driver/app/modules/home/views/job_list_view/widgets/custom_check_box.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusesWrapList extends StatelessWidget {
  const StatusesWrapList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final JobListController controller;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: controller.actualShippingStatuses.map((orderStatusModel) {
        print("actualShippingStatuses object" + jsonEncode(orderStatusModel));
        return Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Obx(() => CustomCheckBox(
                isChecked: orderStatusModel.isSelected.value,
                onTap: () {
                  CustomLogger().print(
                      "Selected model: ${jsonEncode(orderStatusModel)}",
                      lineNumber: 154);
                  controller.orderStatusSelected(orderStatusModel);
                })),
            Text(orderStatusModel.orderStatus ?? ""),
          ],
        );
      }).toList(),
    );
  }
}
