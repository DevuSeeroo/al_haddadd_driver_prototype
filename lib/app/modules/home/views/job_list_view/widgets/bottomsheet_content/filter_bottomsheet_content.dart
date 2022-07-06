import 'dart:convert';

import 'package:alhaddad_driver/app/modules/home/controllers/job_list_controller.dart';
import 'package:alhaddad_driver/app/widgets/buttons/solid_button_widget.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'date_picker_widget.dart';
import 'filter_title_widget.dart';
import 'statuses_wrap_list.dart';
import 'title_close_widget.dart';

class FilterBottomSheetContent extends StatelessWidget {
  const FilterBottomSheetContent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final JobListController controller;

  @override
  Widget build(BuildContext context) {
    print(
        "Filter: actualOrderStatuses:${jsonEncode(controller.actualOrderStatuses)}");
    // print(
    //     "Filter: tempOrderStatuses:${jsonEncode(controller.tempOrderStatuses)}");
    print("Filter: orderStatusIDs:${jsonEncode(controller.orderStatusIDs)}");
    print(
        "Filter: tempOrderStatusIDs:${jsonEncode(controller.tempOrderStatusIDs)}");
    return IntrinsicHeight(
      child: Container(
        padding:
            const EdgeInsets.only(top: 20.0, left: 10, right: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleCloseWidget(controller: controller),
            const SizedBox(height: 10),
            DatePickerWidget(
                hintText: LocaleKeys.fromDate.tr,
                editingController: controller.fromDateController,
                onTap: () {
                  controller.datePickerFunction(context, whetherFromDate: true);
                }),
            const SizedBox(height: 10),
            DatePickerWidget(
                hintText: LocaleKeys.toDate.tr,
                editingController: controller.toDateController,
                onTap: () {
                  controller.datePickerFunction(context,
                      whetherFromDate: false);
                }),
            const SizedBox(height: 10),
            FilterTitleWidget(title: LocaleKeys.chooseStatus.tr),
            StatusesWrapList(controller: controller),
            Container(
                alignment: AlignmentDirectional.centerEnd,
                margin: const EdgeInsetsDirectional.only(end: 10),
                child: SolidButton(
                    title: LocaleKeys.apply.tr,
                    onPressed: () {
                      controller.applyClicked();
                    }))
          ],
        ),
      ),
    );
  }
}
