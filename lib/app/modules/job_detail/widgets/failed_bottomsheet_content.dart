import 'dart:ui' as ui;

import 'package:alhaddad_driver/app/modules/job_detail/controllers/job_detail_controller.dart';
import 'package:alhaddad_driver/app/widgets/buttons/solid_button_widget.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FailedBottomSheetContent extends StatelessWidget {
  const FailedBottomSheetContent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final JobDetailController controller;

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
                  LocaleKeys.deliveryFailed.tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            const SizedBox(height: 10),
            Container(
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
                        child: TextFormField(
                          enableInteractiveSelection: true,
                          maxLines: null,
                          textAlignVertical: TextAlignVertical.top,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: LocaleKeys.reason.tr,
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                                left: 10, right: 10, top: 2, bottom: 10),
                            // contentPadding: EdgeInsets.zero,
                          ),
                          controller: controller.reasonTextEditingController,
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 10),
            Container(
                alignment: AlignmentDirectional.centerEnd,
                margin: const EdgeInsetsDirectional.only(end: 10),
                child: SolidButton(
                    title: LocaleKeys.submit.tr,
                    onPressed: () {
                      controller.deliveryFailedButtonPressed();
                    }))
          ],
        ),
      ),
    );
  }
}
