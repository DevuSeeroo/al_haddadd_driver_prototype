import 'dart:ui' as ui;

import 'package:alhaddad_driver/app/modules/home/controllers/job_list_controller.dart';
import 'package:alhaddad_driver/app/modules/home/views/job_list_view/widgets/custom_check_box.dart';
import 'package:alhaddad_driver/app/widgets/buttons/solid_button_widget.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterBottomSheetContent extends StatelessWidget {
  const FilterBottomSheetContent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final JobListController controller;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding:
            const EdgeInsets.only(top: 20.0, left: 10, right: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.choose_date.tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                IconButton(
                    onPressed: () {
                      Get.back();
                      controller.fromDateController.text = "";
                      controller.toDateController.text = "";
                      controller.choosedToDate = null;
                      controller.choosedFromDate = null;
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            const SizedBox(height: 10),
            Container(
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Directionality(
                        textDirection: ui.TextDirection.ltr,
                        child: TextField(
                          readOnly: true,
                          enableInteractiveSelection: true,
                          maxLines: 1,
                          textAlignVertical: TextAlignVertical.top,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: LocaleKeys.from_date.tr,
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                                left: 10, right: 10, top: 2, bottom: 10),
                            // contentPadding: EdgeInsets.zero,
                          ),
                          controller: controller.fromDateController,
                          onTap: () {
                            controller.datePickerFunction(context,
                                whetherFromDate: true);
                          },
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 2,
                    )
                  ],
                )),
            const SizedBox(height: 10),
            Container(
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Directionality(
                        textDirection: ui.TextDirection.ltr,
                        child: TextField(
                          readOnly: true,
                          enableInteractiveSelection: true,
                          maxLines: 1,
                          textAlignVertical: TextAlignVertical.top,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: LocaleKeys.to_date.tr,
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                                left: 10, right: 10, top: 2, bottom: 10),
                            // contentPadding: EdgeInsets.zero,
                          ),
                          controller: controller.toDateController,
                          onTap: () {
                            controller.datePickerFunction(context,
                                whetherFromDate: false);
                          },
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 2,
                    )
                  ],
                )),
            const SizedBox(height: 10),
            Text(LocaleKeys.choose_status.tr,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Wrap(
              children: controller.actualOrderStatuses.map((orderStatusModel) {
                return Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Obx(() => CustomCheckBox(
                        isChecked: orderStatusModel.isSelected.value,
                        onTap: () {
                          controller.orderStatusSelected(orderStatusModel);
                        })),
                    Text(orderStatusModel.orderStatus ?? ""),
                  ],
                );
              }).toList(),
            ),
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
